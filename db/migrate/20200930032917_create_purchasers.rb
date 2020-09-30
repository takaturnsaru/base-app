class CreatePurchasers < ActiveRecord::Migration[6.0]
  def change
    create_table :purchasers do |t|
      t.datetime :buyday, null:false
      t.references :client, null:false,foregin_key:true

      t.timestamps
    end
  end
end
