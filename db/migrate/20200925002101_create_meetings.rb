class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.string :name,          nill:false
      t.text :text,            nill:false
      t.timestamps
    end
  end
end
