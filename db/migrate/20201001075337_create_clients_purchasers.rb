class CreateClientsPurchasers < ActiveRecord::Migration[6.0]
  def change
    create_table :clients_purchasers do |t|
      t.references :client, null:false, foregin_key:true
      t.references :purchaser, null:false, foregin_key:true

      t.timestamps
    end
  end
end
