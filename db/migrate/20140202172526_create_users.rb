class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string "name" ,:limit => 75
      t.string "password", :limit => 40
      t.string "email",:default => "",:null => false
      t.string "hashed_password"
      t.timestamps
      t.integer "shop_cost"
      t.string "salt"
    end
 end

  def down
    drop_table :users
  end

end
