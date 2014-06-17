class AddToDishes < ActiveRecord::Migration
  def up  
     add_column("dishes", "shared", :boolean)
  end
  
  def down
    remove_column("dishes", "shared")
  end
end
