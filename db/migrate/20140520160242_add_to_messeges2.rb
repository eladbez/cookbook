class AddToMesseges2 < ActiveRecord::Migration
 def up
   add_index('messeges', 'receiver_id') 
   add_index('messeges', 'sender_id') 
 end
 
 def down
   remove_index('messeges', 'receiver_id')
   remove_index('messeges', 'sender_id')
 end
end
