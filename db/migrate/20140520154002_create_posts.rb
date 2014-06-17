class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :image
      t.text :content
      t.datetime :last_visit
      t.references :postable, :polymorphic => true
      t.timestamps
    end
  end
end
