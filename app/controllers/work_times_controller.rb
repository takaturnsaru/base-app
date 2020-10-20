class WorkTimesController < ApplicationController

  
  def create
    @work_time = WorkTime.new(attendance:Time.current,user_id:current_user.id)
    @work_time.valid?
    @work_time.save
    redirect_to schedules_path
  end  
   
  private

end
