class AddImageColumn < ActiveRecord::Migration
  def up  
     add_column("dishes", "image", :binary)
  end
  
  def down
    remove_column("dishes", "image")
  end



end
