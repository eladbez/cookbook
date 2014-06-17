class CreateObligations < ActiveRecord::Migration
  def up
    create_table :obligations do |t|
      t.references :dish
      t.references :participation
      t.timestamps
    end
     add_index :obligations, ['dish_id', 'participation_id'] 
  end
  
  def down
    drop_table :obligations   
  end
end
