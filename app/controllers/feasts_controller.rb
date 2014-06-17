class FeastsController < ApplicationController

  def list
    @user_feast_m=Feast.joins(participations: :user).where(participations: {manager: true}).to_a
    @user_feast_p=Feast.joins(participations: :user).where(participations: {manager: false}).to_a
  end

  def show
    @feast=feast.find(params[:id])
    @users=@feast.users
    @dishes=(Dish.joins(obligations: {participation: :feast}).where(feast: {id:@feast.id }).to_a + @feast.dishes).compact
  end

  def new
    @feast= Feast.new
  end

  def create
     end

  def update
  end

  def edit
    @feast=feast.find(params[:id])
    @users=@feast.users.sort{|user1,user2| user2.manager <=> user1.manager}.sort_by{|user| user.name}    
    @dishes=(Dish.joins(obligations: {participation: :feast}).where(feast: {id:@feast.id }).to_a + @feast.dishes).compact
  end

  def delete
     @feast=Feast.find(params[:id])
  end
  
  def destroy
  end

  def print
     
     respond_to do |format| 
      format.html
      format.js
     end
    
  end
  

end
