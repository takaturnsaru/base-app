class Purchaser < ApplicationRecord

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to_active_hash :product_specification

belongs_to :client

with_options presence:true do
  validates :product_specification_id,numericality: { other_than: 0, message:"を選択してください。"}
  validates :unit_price
  validates :quanity
  validates :amount
  
end
end


