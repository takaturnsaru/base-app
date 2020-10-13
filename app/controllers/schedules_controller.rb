class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @meetings = current_user.meetings.all
    @meeting = Meeting.new
  end
end
