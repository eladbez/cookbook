class AddToUsers < ActiveRecord::Migration
   def up  
     add_column("users", "city", :string)
     add_column("users", "street_num", :string)
     add_column("users", "entrance", :string)
     add_column("users", "level", :string)
     add_column("users", "apartment_num", :string)
     add_column("users", "neighborhood", :string)
     add_column("users", "kosher?", :string)
     add_column("users", "image", :string)
  end
  
  def down
     remove_column("users", "city")
     remove_column("users", "street_num")
     remove_column("users", "entrance")
     remove_column("users", "level")
     remove_column("users", "apartment_num")
     remove_column("users", "neighberhood")
     remove_column("users", "kosher?")
     remove_column("users", "image")
  end
end
