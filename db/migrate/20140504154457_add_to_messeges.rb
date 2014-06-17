class AddToMesseges < ActiveRecord::Migration
   def up  
     add_column("messeges", "receiver_id", :integer)
     add_column("messeges", "sender_id", :integer)
     add_column("messeges", "news?", :boolean)
  end
  
  def down
     remove_column("messeges", "receiver_id")
     remove_column("messeges", "sender_id")
     remove_column("messeges", "news?")
  end
end
