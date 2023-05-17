class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      t.timestamps
      t.integer :customer_id,null: false #顧客ID
      t.integer :item_id,null: false #商品ID
      t.integer :quantity,null: false #商品
      
    end
  end
end
