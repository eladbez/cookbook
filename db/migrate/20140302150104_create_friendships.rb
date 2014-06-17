class CreateFriendships < ActiveRecord::Migration
   def up
    create_table :friendships do |t|
      t.references :user
      t.references :friend
      t.timestamps 
    end
    
    add_index :friendships, ['user_id', 'friend_id']  
  end

  def down 
    drop_table :friendships
  end
end
