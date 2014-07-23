class Grocery < ActiveRecord::Base
  
  belongs_to :dish
  validates :quantity, numericality: true
  
  
end
