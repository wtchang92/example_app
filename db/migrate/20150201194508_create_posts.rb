class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.decimal :price
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :posts, [:user_id, :created_at]
  end
end
