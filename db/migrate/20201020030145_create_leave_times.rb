class CreateLeaveTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :leave_times do |t|
      t.datetime :leave,  null:false
      t.references :user,      null:false,foregin_key:true

      t.timestamps
    end
  end
end
