class CreateBelongings < ActiveRecord::Migration
  def up
    create_table :belongings do |t|
      t.references :user
      t.references :dish
      t.timestamps
   end
    
    add_index :belongings, ['user_id', 'dish_id']  
  end

  def down 
    drop_table :belongings
  end
end

    