class AddToParticipations < ActiveRecord::Migration
   def up  
     add_column("participations", "accepted", :boolean)
     add_column("participations", "coming", :string, :default => "invitation sent")
     add_column("participations", "manager", :boolean, :default => false)
  end
  
  def down
    remove_column("participations", "accepted")
    remove_column("participations", "coming")
    remove_column("participations", "manager")
  end
end
