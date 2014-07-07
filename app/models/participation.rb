class Participation < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :feast
  
  has_many :obligations, dependent: :destroy
  has_many :dishes, :through=> :obligations
  has_many :groceries, :as => :needed 
  
   accepts_nested_attributes_for :obligations,
  :allow_destroy => true
  
     
end
