class SchedulesController < ApplicationController
  before_action :move_to_root

  def index
    @work_times = current_user.work_times.all.order("created_at DESC")
    @leave_times = current_user.leave_times.all.order("created_at DESC")
    @work_time = WorkTime.new
    @leave_time = LeaveTime.new
  end

  private
  def move_to_root
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
