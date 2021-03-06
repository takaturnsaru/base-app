class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :schedules
         has_many :work_times
         has_many :meetings
         has_many :leave_times

         validates :name,presence:true
end
