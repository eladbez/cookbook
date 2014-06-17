class CreateMesseges < ActiveRecord::Migration
  def up
    create_table :messeges do |t|
      t.text "content"
      t.string "subject"
      t.timestamps
    end
  end
  
  def down
    drop_table :messeges
  end
 
end
