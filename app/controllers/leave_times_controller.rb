class LeaveTimesController < ApplicationController
  def index
  end
  
  def create
    @leave_time = LeaveTime.create(leave:Time.current,user_id:current_user.id)
    @leave_time.valid?
    @leave_time.save
    redirect_to schedules_path
  end

end
