class CreateWorkTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :work_times do |t|
      t.datetime :time,      null:false
      t.references :user,          null:false,foregin_key:true

      t.timestamps
    end
  end
end
