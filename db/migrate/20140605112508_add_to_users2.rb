class AddToUsers2 < ActiveRecord::Migration
  def up
     rename_column("users", "kosher?", "kosher")    
   end
   
   def down
     rename_column("users", "kosher", "kosher?")    
   end
end
