class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @meetings = Meeting.all
    @meeting = Meeting.new
  end
end
