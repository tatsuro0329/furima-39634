class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  validates :image, :title, :text, :category_id, :condition_id, :delivery_charge_id, :sender_id, :days_to_ship_id, :price, presence: true
  validates :category_id, :condition_id, :delivery_charge_id, :sender_id, :days_to_ship_id, :price, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, numericality: { only_integer: true, message: "は半角数字のみ使用してください" }
  validates :price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9999999,
    message: "は300円から9,999,999円の間で設定してください"
  }

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :sender
  belongs_to_active_hash :days_to_ship
  belongs_to :user
  has_one :buying_record

  has_one_attached :image
end