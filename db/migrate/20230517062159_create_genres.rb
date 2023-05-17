class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|

      t.timestamps
      t.string :name,null: false #商品名
    end
  end
end
