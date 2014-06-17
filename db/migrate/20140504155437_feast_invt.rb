class FeastInvt < ActiveRecord::Migration
   def up
    create_table :FeastInvt do |t|
      t.integer "sender_id"
      t.integer "receiver_id"
      t.integer "feast_id"
      t.boolean "meneger?"
    end
 end

  def down
    drop_table :FeastInvt
  end

end
