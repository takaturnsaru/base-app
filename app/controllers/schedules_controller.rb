class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @meetings = Meeting.all
  end

  def create
    schedule = Schedule.create(text:params[:text])
    render json:{schedule: schedule}
  end
end
