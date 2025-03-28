class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def create
    @movie = Movie.new(movie_params)

    if Movie.find_by(name: @movie.name) != nil
      flash.now[:alert] = "その名前の映画はすでに登録されています。" # 即時表示
      render :new, status: :unprocessable_entity
    elsif @movie.save
      redirect_to admin_movies_path, notice: "登録に成功しました！"
    else
      flash.now[:alert] = "登録に失敗しました。"
      render :new, status:400
    end
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id]);
    @schedules = @movie.schedules
    render :edit
  end

  def edit
    @movie = Movie.find(params[:id]);
    @schedules = @movie.schedules
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      redirect_to admin_movies_path, notice: "編集に成功しました！"
    else
      flash.now[:alert] = "編集に失敗しました。"
      render :edit, status:400
    end
  end

  def destroy
    @movie = Movie.find(params[:id])

    if @movie.delete
      redirect_to admin_movies_path, notice: "削除に成功しました！"
    else
      flash.now[:alert] = "削除に失敗しました。"
      render :edit, status:400
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :year, :is_showing, :description, :image_url)
  end
end