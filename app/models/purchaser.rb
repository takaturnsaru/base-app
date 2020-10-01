class Purchaser < ApplicationRecord

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to_active_hash :product_specification

has_many :clients_purchasers
has_many :clients, through: :clients_purchasers

validates :buyday,presence:true
end


