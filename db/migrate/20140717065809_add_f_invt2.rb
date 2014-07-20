class AddFInvt2 < ActiveRecord::Migration
  def up
    remove_column("feast_invts","meneger?")
    add_column("feast_invts", "manager", :boolean, :default => false)
  end
  
  def down
    remove_column("feast_invts","manager")
    add_column("feast_invts","meneger?", :boolean)
  end
end
