class Grocery < ActiveRecord::Base
  belongs_to :needed, :polymorphic => true

  validates :quantity, numericality: true
  validates :name, presence: true
  
end
