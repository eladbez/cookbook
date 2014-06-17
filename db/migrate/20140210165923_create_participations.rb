class CreateParticipations < ActiveRecord::Migration
  def up
    create_table :participations do |t|
      t.references :user
      t.references :feast
      t.timestamps
      t.integer "user_costs"
      
   end
    
    add_index :participations, ['user_id', 'feast_id']  
  end

  def down 
    drop_table :participations
      
  end
end
