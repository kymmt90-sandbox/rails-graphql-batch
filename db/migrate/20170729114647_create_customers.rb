class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :customers, :name, unique: true
  end
end
