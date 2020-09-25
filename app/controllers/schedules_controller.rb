class SchedulesController < ApplicationController
  def index
    @meetings = Meeting.all
  end
end
