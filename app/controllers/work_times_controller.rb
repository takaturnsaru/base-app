class WorkTimesController < ApplicationController

  def index
    @work_time = WorkTime.all
  end
  
  def create
    WorkTime.create(created_at:params[:created_at])
    render json:{work_time: work_time}
  end   
end
