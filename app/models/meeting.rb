class Meeting < ApplicationRecord

  belongs_to :user

  validates :name,:text,:start_time,presence:true
end
