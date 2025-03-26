class Admin::SchedulesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @schedule = Schedule.find_by(id:params[:id])
    render :edit
  end

  def edit
    @schedule = Schedule.find_by(id:params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])

    if @schedule.update(schedule_params)
      redirect_to admin_schedules_path, notice: "編集に成功しました！"
    else
      flash.now[:alert] = "編集に失敗しました。"
      render :edit, status:400
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])

    if @schedule.delete
      redirect_to admin_schedules_path, notice: "削除に成功しました！"
    else
      flash.now[:alert] = "削除に失敗しました。"
      render :edit, status:400
    end
  end

  def new
    @movie = Movie.find_by(id:params[:movie_id])
    @schedule = @movie.schedules.new
  end

  def create
    @schedule = Schedule.create(schedule_params)

    if @schedule.save
      redirect_to admin_schedules_path, notice: "追加に成功しました！"
    else
      flash.now[:alert] = "追加に失敗しました。"
      render :new, status:400
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:start_time, :end_time, :movie_id)
  end

end