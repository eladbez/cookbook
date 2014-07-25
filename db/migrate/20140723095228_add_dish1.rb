class AddDish1 < ActiveRecord::Migration
  def up
    remove_column("dishes", "shared")
    add_column("dishes", "shared", :boolean, default: true)
  end
  
  def down
    remove_column("dishes", "shared")
    add_column("dishes", "shared", :boolean)
  end

end
