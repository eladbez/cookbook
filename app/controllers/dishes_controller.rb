class DishesController < ApplicationController
  
 
  
  def index
    session[:user_id] = nil    
    redirect_to('sort_form')
  end
  
  def sort _form
  end
  
  def list
    @results=search
  end
  
  
  def show
    @dish=Dish.find(params[:id])
    @feast=find(params[:feast_id]) if params[:feast_id]
  end

  def new
    @dish=Dish.new
    
  end

  def create
    @dish = Dish.new(dish_params)
   if @dish.save
      flash[:notice]="your dish is catalogged"
      redirect_to(:action=>'sort_form')
    else
      render('new')
    end
  end

  def update
    @dish = Dish.find(params[:id])
    if @dish.update_attributes(dish_params)
      flash[:notice]="dish updated"
      redirect_to(:action=>'show', :id=>@dish.id)
    else
      render('edit')
    end
  end

  def edit
    @dish=Dish.find(params[:id])
  end

  
   def delete
    @dish = Dish.find(params[:id])
   end
  
  def destroy
    dish = Dish.find(params[:id])
    dish.destroy
    flash[:notice] = "this recipe is no more!"
    redirect_to(:action => 'sort_form')
  end
  
  
   private
    
     def dish_params
         params.fetch(:dish, {}).permit(:name, :culture, :id, :grocery, :mealpart, :recipe, :taste, :health_value, :img_source, :user_id, :feast_id, :created_at ,:image)
     end
   
     def dish_params1
         params.permit(:taste, :culture, :mealpart, :recipe, :image)
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
end
