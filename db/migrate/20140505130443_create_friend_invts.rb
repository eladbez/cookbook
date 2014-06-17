class CreateFriendInvts < ActiveRecord::Migration
  def up
    create_table :friend_invts do |t|
      t.integer "feast_id" 
      t.integer "receiver_id"
      t.integer "sender_id"
      t.timestamps
    end
  end
end
