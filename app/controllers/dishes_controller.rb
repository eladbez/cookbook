class DishesController < ApplicationController
  
 
  
  def index #only my recipes
    @dishes = User.find(session[:user_id]).dishes.to_a
  end
  
  def sort_form
  end
 
  def list
    unless params[:state]
      @results=search
    else
      @results=Dish.where(shared: true)
    end
  end
  
  
  def show
    @dish = Dish.find(params[:id])
    @feast = find(params[:feast_id]) if params[:feast_id]
  end

  def new
    @stat="new"
    @dish=Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    if session[:user_id]
      @dish.belongings.build(user_id: session[:user_id])
    end
   if @dish.save
      flash[:notice]="your dish is catalogged"
      unless session[:user_id]
        redirect_to(:action => 'sort_form')
      else
        redirect_to(:action => 'index')
      end
    else
      render('new')
    end
  end

  def update
    @dish = Dish.find(params[:id])
    if @dish.update_attributes(dish_params)
      flash[:notice]="dish updated"
      unless session[:user_id]
        redirect_to(:action => 'sort_form')
      else
        redirect_to(:action => 'index')
      end
    else
      render('edit')
    end
  end

  def edit
    @stat="edit"
    @dish=Dish.find(params[:id])
  end

  
   def delete
    @dish = Dish.find(params[:id])
    session[:state] = params[:state]
   end
  
  def destroy
    dish = Dish.find(params[:id])
    dish.destroy
    flash[:notice] = "this recipe is no more!"
    unless session[:user_id]
      redirect_to(:action => 'sort_form')
    else
      redirect_to(:action => 'index')
    end
  end
  
  def search_form
     render layout: "user"
  end
  
  def results
      @results=search
      render layout: "user"
  end
   
   
   private
    
     def dish_params
         params.require(:dish).permit(:shared,:user_id,:name, :culture, :id, :mealpart, :recipe, :taste, :health_value, :img_source, :user_id, :feast_id, :created_at ,:image,groceries_attributes: [:id,:quantity,:measure,:name,:feast_id,:dish_id,:_destroy],belongings_attributes: [:id,:user_id,:dish_id])
     end
   
     def dish_params1
         params.permit(:taste, :culture, :mealpart, :recipe, :image)
     end

      
   def search
      dish_s=Dish.all
      name_s=params[:name]
      taste_s=params[:taste]
      culture_s=params[:culture]
      id_s=params[:id] 
      
      unless name_s.blank?
        dish_s=dish_s.where(["name LIKE ?","%#{name_s}%"])
      end
      
      unless taste_s.blank?  
        dish_s=dish_s.where(:taste => taste_s)
      end
      unless culture_s.blank?
        dish_s=dish_s.where(:culture => culture_s)
      end
      
      unless id_s.blank?
        dish_s=dish_s.where(:user_id => id_s)
      else 
        dish_s=dish_s.where(:shared => true)
      end
      
   if false
      mealpart_s=params[:mealpart]
      recipe_s=params[:recipe]
     
      unless mealpart_s.blank?
        dish_s=dish_s.where(:mealpart => mealpart_s)
      end
    
      unless recipe_s.blank?
        dish_s=dish_s.where(["recipe LIKE ?","%#{recipe_s}%"])
      end
   end
    
    
      return dish_s
    end
end
