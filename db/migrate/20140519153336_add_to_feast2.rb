class AddToFeast2 < ActiveRecord::Migration
   def up
     rename_column("feasts", "time", "feast_time")    
   end
   
   def down
     rename_column("feasts", "feast_time", "time")    
   end
   
end

