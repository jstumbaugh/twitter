class RenameStatusesToTweets < ActiveRecord::Migration[5.2]
  def change
    rename_table :statuses, :tweets
  end
end
