class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,         null:false
      t.string :grade_id,        null:false
      t.integer :price,       null:false
      t.references :admin,    null:false,foregin_key:true

      t.timestamps
    end
  end
end
