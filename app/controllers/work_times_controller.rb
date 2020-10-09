class WorkTimesController < ApplicationController

  def index
    @user = User.find(current_user[:id])
    @work_times = WorkTime.includes(:@user).order("created_at DESC")
  end
  
  def create
    @user = User.find(current_user[:id])
    work_time = WorkTime.create(time: Time.current,user_id: @user.id)
    render json:{work_time: work_time}
  end  
   
end
