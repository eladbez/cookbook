class CreateCourses < ActiveRecord::Migration
  def up
    create_table :courses do |t|
      t.references :dish
      t.references :feast
      t.timestamps
    end
    
    add_index :courses, ['dish_id', 'feast_id']  
  end

  def down 
    drop_table :courses
  end
end
