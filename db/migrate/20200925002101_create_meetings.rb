class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.string :name,          nill:false
      t.datetime :start_time,  nill:false

      t.timestamps
    end
  end
end
