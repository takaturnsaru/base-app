class UsersController < ApplicationController
  before_action :move_to_root
  def show
    @meetings = current_user.meetings
    @meeting = Meeting.new
  end

  def move_to_root
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
