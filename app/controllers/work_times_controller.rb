class WorkTimesController < ApplicationController

  def index
    @work_times = WorkTime.all
  end
  
  def create
    @user = User.find(current_user[:id])
    work_time = WorkTime.create(user_id: @user.id,time:Time.current)
    render json:{work_time: work_time}
  end   
end
