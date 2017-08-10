class CreateDeliverers < ActiveRecord::Migration[5.1]
  def change
    create_table :deliverers do |t|
      t.string :name

      t.timestamps
    end
  end
end
