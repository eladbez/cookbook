class CreateDishes < ActiveRecord::Migration
  def up
    create_table :dishes do |t|
      t.string "name"
      t.string "taste"
      t.string "culture"
      t.string "mealpart"
      t.text "recipe"
      t.text "health_value"
      t.timestamps
      t.references :feast
      t.references :user
      end
      add_index('dishes', 'user_id') 
      add_index('dishes', 'feast_id') 
  end

  def down 
    drop_table :dishes
  end



end
