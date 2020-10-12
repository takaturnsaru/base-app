class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.valid?
    @meeting.save
    redirect_to schedules_path
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json

  def edit
    @meetings = Meeting.all
  end

  def update
    @meeting.update(meeting_params)
    if @meeting.valid?
      @meeting.save 
      redirect_to schedules_path
    else
      render edit
    end
  end

  def destroy
    @meeting.destroy
    redirect_to schedules_path
  end

  private

  def set_meeting
      @meeting = Meeting.find(params[:id])
    end


    def meeting_params
      params.require(:meeting).permit(:name, :start_time)
    end
end
