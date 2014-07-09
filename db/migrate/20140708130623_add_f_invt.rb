class AddFInvt < ActiveRecord::Migration
  def up
    rename_table("feastinvt", "feast_invts")
    add_column("feasts", "content", :text)
  end
  
  def down
    rename_table("feast_invts","feastinvt")
    remove_column("feast", "content")
  end
end
