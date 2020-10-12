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
    # respond_to do |format|
    #   if @meeting.update(meeting_params)
    #     format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @meeting }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @meeting.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    redirect_to schedules_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meeting_params
      params.require(:meeting).permit(:name, :start_time)
    end
end
