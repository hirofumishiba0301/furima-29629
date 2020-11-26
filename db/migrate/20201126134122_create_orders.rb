class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :price,foreign_key: true
      t.integer :user,foreign_key: true
      t.integer :item,foreign_key: true
      t.timestamps
    end
  end
end
