class CreateFeastInvts < ActiveRecord::Migration
  def up
    create_table :feast_invts do |t|
      t.references :invitable, polymorphic: true
      t.timestamps
    end
  end
  
  def down
    drop_table :feast_invt
  end
  
end
