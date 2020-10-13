class UsersController < ApplicationController
  def show
    @meetings = current_user.meetings
    @meeting = Meeting.new
  end
end
