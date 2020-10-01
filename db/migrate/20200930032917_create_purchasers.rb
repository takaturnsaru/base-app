class CreatePurchasers < ActiveRecord::Migration[6.0]
  def change
    create_table :purchasers do |t|
      t.date :buyday,                     null:false
      t.integer :product_specification_id,    default:""
      t.integer :unit_price,                  default:""
      t.integer :quanity,                     default:""
      t.integer :amount,                      default:""
      t.references :client,                   null:false,foregin_key:true

      t.timestamps
    end
  end
end
