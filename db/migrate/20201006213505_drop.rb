class Drop < ActiveRecord::Migration[6.0]
  def change
    drop_table :clients_purchasers
  end
end
