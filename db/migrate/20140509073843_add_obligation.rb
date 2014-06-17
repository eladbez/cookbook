class AddObligation < ActiveRecord::Migration
  def up  
     add_column("obligations", "agreed", :string)
  end
  
  def down
    remove_column("obligations", "agreed")
  end
end
