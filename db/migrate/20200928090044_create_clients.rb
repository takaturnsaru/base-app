class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name,         nill:false
      t.string :postal_code,  nill:false
      t.integer :prefectures_id,  nill:false
      t.string :city,          null:false
      t.string :address,       nill:false
      t.string :building_name, default:""
      t.string :phone_number,  nill:false
      t.timestamps
    end
  end
end
