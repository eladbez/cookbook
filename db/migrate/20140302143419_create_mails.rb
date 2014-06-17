class CreateMails < ActiveRecord::Migration
  def up
    create_table :mails do |t|
      t.references :sender
      t.references :receiver
      t.timestamps 
      t.references :messege
    end
    
    add_index :mails, ['receiver_id', 'sender_id']  
  end

  def down 
    drop_table :mails
  end
end
