class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.timestamps
      t.integer :genre_id,null: false #ジャンルID
      t.string :name,null: false #商品名
      t.text :introduction,null: false #商品説明
      t.integer :price,null: false #単価（税抜）
      
    end
  end
end