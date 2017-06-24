class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.date :request_at
      t.date :accepted_at
      t.date :unfriend_at
      t.integer :status

      t.timestamps
    end
  end
end
