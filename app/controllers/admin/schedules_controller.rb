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

  private

  def schedule_params
    params.require(:schedule).permit(:start_time, :end_time)
  end

end