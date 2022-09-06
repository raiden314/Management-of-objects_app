class AddUserId < ActiveRecord::Migration[7.0]
  def change
    add_culumn :posts, :user_id, :string
  end
end
