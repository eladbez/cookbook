class AddToFeast3 < ActiveRecord::Migration
 def up
     rename_column("feasts", "place", "feast_place")
     add_column("feasts","name", :string, :default => "has no name")   
   end
   
   def down
     rename_column("feasts", "feast_place", "place")    
     remove_column("feasts","name")
   end
end
