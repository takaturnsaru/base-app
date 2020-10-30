class Client < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefectures

  has_many :purchasers



  with_options presence: true do
    validates :name
    validates :postal_code,format: {with:/\A\d{3}[-]\d{4}\z/}
    validates :prefectures_id, numericality: { other_then: 0, message:"都道府県を選択してください"}
    validates :city
    validates :address
    validates :phone_number, length:{maximum: 11}, format: {with:/\A\d{10,11}\z/}
  end
end
