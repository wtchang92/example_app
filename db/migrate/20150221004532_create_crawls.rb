class CreateCrawls < ActiveRecord::Migration
  def change
    create_table :crawls do |t|
      t.string :title
      t.integer :stops

      t.timestamps null: false
    end
  end
end
