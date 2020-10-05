class Schedule < ApplicationRecord
  belongs_to :user
  has_many :meeting

  validates :text ,presence:true
end
