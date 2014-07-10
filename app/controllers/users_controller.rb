class UsersController < ApplicationController
  
   
   
   before_filter :confirm_logged_in, :except => [:new,:create]
   
   layout "user"

  
  def index
    list
    redirect_to(:action => 'list')
  end
  
  def list
    @users = User.search(params[:search_name]).sorted
  end
  
  def show
    
    @user = User.find(params[:id])
    @myself = @user.id==session[:user_id]
    @notmyfriend = @user.friends.blank?
    @friends = @user.friends.to_a 
    
    if session[:feast_id] 
      not_invited= Participation.where("feast_id=#{session[:feast_id]} AND user_id=#{@user.id}").blank?
    end
    
    if session[:dish_id]
      par = Participation.where("feast_id=session[:feast_id] AND user_id=#{@user.id}")
      not_assigned= Obligation.where("dish_id=session[:dish_id] AND participation_id=#{par.id}").blank?
    end
  end  
    

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'user created.'
      session[:user_id]=@user.id  
      redirect_to(:controller => 'access', :action => 'menu') 
    else
      render("new")
    end
    
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = 'user updated.'
      redirect_to(:action => 'list')
    else
      render("edit")
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "user deleted."
    redirect_to(:action => 'list')
  end
  
  def search
    
  end
  
  def results
     @users = User.search(params[:search_name]).sorted
  end

  private
    
    def user_params
      params.fetch(:user, {}).permit(:name,:password,:email,:city,:street_num,:entrance,:level,:apartment_num,:neighborhood,:kosher?,:image,)
    end

end

  
  
  
  