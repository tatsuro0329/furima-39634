class Buy
  include ActiveModel::Model
  attr_accessor :post_code, :sender_id, :municipalities, :house_number, :building_name, :tel, :item_id, :user_id, :token, :price

  with_options presence: true do
    validates :user_id, :item_id, :post_code, :sender_id, :municipalities, :house_number, :tel, :token
    validates :sender_id, numericality: {other_than: 1, message: "can't be blank"}
  end

  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :tel, format: { with: /\A\d{10,11}\z/, message: "must be 10 or 11 digits" }

  def save
    buying_record = BuyingRecord.create(item_id: item_id, user_id: user_id)
    Address.create(
      post_code: post_code,
      sender_id: sender_id,
      municipalities: municipalities,
      house_number: house_number,
      building_name: building_name,
      tel: tel,
      buying_record_id: buying_record.id
    )
  end
end