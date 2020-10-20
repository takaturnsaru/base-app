class SchedulesController < ApplicationController
  def index
    @work_times = current_user.work_times.all.order("created_at DESC")
    @leave_times = current_user.leave_times.all.order("created_at DESC")
    @work_time = WorkTime.new
    @leave_time = LeaveTime.new
  end
end
