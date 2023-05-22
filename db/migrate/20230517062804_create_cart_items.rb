class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      t.integer :quantity, null: false #個数
      t.references :customer, null: false, foreign_key: true #顧客ID
      t.references :item, null: false, foreign_key: true #商品ID

      t.timestamps
    end
  end
end
