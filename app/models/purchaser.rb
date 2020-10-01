class Purchaser < ApplicationRecord

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to_active_hash :product_specification

belongs_to :client

validates :buyday,presence:true
end


