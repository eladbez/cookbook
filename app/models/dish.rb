class Dish < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader
  
  has_many :belongings
  has_many :users, :through => :belongings
  
  has_many :courses, dependent: :destroy
  has_many :feasts, :through => :course
  
  has_many :groceries, dependent: :destroy 
  
  has_many :obligations, dependent: :destroy
  has_many :participations, :through => :obligations 
  
  accepts_nested_attributes_for :groceries, :reject_if => :all_blank,
  :allow_destroy => true
#  validates :name, presence: true
#  validates :taste, presence: true
#  validates :recipe, presence: true
  

 scope :user_dishes, -> {where(user_id=session[:user_id]).order("dishes.name asc")}
 scope :user_search, -> {Dish.search.user_dishes}
 
  accepts_nested_attributes_for :groceries, 
    :allow_destroy => true, 
    :reject_if => :all_blank
  end  

     
   def search
      dish_s=Dish.all
      name_s=params[:name]
      taste_s=params[:taste]
      culture_s=params[:culture]
      mealpart_s=params[:mealpart]
      recipe_s=params[:recipe]
      
      unless name_s.blank?
        dish_s=dish_s.where(["name LIKE ?","%#{name_s}%"])
      end
      
      unless taste_s.blank?  
        dish_s=dish_s.where(:taste => taste_s)
      end
      unless culture_s.blank?
        dish_s=dish_s.where(:culture => culture_s)
      end
      unless mealpart_s.blank?
        dish_s=dish_s.where(:mealpart => mealpart_s)
      end
    
      unless recipe_s.blank?
        dish_s=dish_s.where(["recipe LIKE ?","%#{recipe_s}%"])
      end
      return dish_s
    end