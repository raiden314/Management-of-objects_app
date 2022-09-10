class AddUserId < ActiveRecord::Migration[7.0]
  def change
<<<<<<< HEAD
    add_culumn :posts, :user_id, :string
=======
    add_column :posts, :user_id, :string
>>>>>>> 8adefb5d0f57fc3cf1fa4d6cd50e847adf40f76c
  end
end
