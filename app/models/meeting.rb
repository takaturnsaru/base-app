class Meeting < ApplicationRecord

  validate :name,:text,presence:true
end
