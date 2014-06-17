class AddToFeast < ActiveRecord::Migration
  def up  
     add_column("feasts", "image", :string)
  end
  
  def down
    remove_column("feasts", "image")
  end
end
