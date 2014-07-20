class AddToPosts < ActiveRecord::Migration
  def up
    add_index :posts, [:postable_type,:postable_id]
  end
  
  def down
    remove_index :posts, [:postable_type,:postable_id]
  end
end
