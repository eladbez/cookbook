class CreateFeasts < ActiveRecord::Migration
   def up
     create_table :feasts do |t|
      t.integer "cost"
      t.string "place"
      t.datetime "time"
      t.timestamps
    end
   end
  

  def down
    drop_table :feasts 
   
  end
end


