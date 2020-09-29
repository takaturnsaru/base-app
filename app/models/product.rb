class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :grade, shortcuts: [:name]

  with_options presence: true do
    validates :name
    validates :grade_id, numericality: {other_then: 0, message:"Grade Select"}
    validates :price
  end
    
end
