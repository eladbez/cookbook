class CreateGroceries < ActiveRecord::Migration
  def up
    create_table :groceries do |t|
      t.string "name"
      t.string "measure"
      t.string "quantity"
      t.references :needed, polymorphic: true
      t.timestamps
    end
    add_index("groceries","dish_id") 
    add_index("groceries",'feast_id')
  end

  def down
   drop_table :groceries
  end
end
