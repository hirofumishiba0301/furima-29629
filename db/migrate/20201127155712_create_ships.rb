class CreateShips < ActiveRecord::Migration[6.0]
  def change
    create_table :ships do |t|
      t.references :order ,foreign_key: true
      t.integer :postal_code ,null: false
      t.integer :prefecture_id ,null: false
      t.string :city ,null: false
      t.string :address ,null: false
      t.string :building
      t.integer :phone_number ,null: false
      t.timestamps
    end
  end
end
