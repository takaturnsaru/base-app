class WorkTimesController < ApplicationController

  def index
    @work_time = WorkTime.all.order(:id "DESC")
  end
  
  def create
    Work.create(created_at:params[:created_at])
  end   
end
