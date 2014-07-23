class AddFInvt3 < ActiveRecord::Migration
  def up
     add_column("feast_invts", "updated_at", :datetime)
     add_column("feast_invts", "created_at", :datetime)
     add_column("feast_invts", "answered", :boolean, default: false)
  end
  
  def down
     remove_column("feast_invts", "updated_at")
     remove_column("feast_invts", "created_at")
     remove_column("feast_invts", "answered")
   end
end
