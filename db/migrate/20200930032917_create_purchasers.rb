class CreatePurchasers < ActiveRecord::Migration[6.0]
  def change
    create_table :purchasers do |t|
      t.date :buyday,                     null:false
      t.integer :product_specification_id,    null:false
      t.integer :unit_price,                  null:false
      t.integer :quanity,                     null:false
      t.integer :amount,                      null:false
      t.references :client,                   null:false,foregin_key:true

      t.timestamps
    end
  end
end
