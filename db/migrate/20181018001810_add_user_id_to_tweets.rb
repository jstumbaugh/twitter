class AddUserIdToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :user_id, :bigint, foreign_key: true, null: false
  end
end
