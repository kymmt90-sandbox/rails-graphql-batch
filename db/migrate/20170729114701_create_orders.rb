class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :price, null: false
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
