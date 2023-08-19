class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string     :post_code,    null: false
      t.integer    :sender_id,      null: false
      t.string     :municipalities, null: false
      t.string     :house_number,   null: false
      t.string     :building_name
      t.string     :tel,            null: false
      t.references :buying_record,  null: false, foreign_key: true
      t.timestamps
    end
  end
end