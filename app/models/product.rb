class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :grade, shortcuts: [:name]

  belongs_to :admin

  with_options presence: true do
    validates :name
    validates :grade_id, numericality: {other_than: 0, message:"を選択してください。"}
    validates :price
  end
    
end
