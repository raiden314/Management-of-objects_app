class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :name
      t.date :date
      t.text :memo
      t.string :image_name

      t.timestamps
    end
  end
end
