class FeastsController < ApplicationController
@try||=nil 
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
    @myself = User.find(session[:user_id])
     respond_to do |format| 
      format.html 
      format.js 
     end
  end

  def create
   @feast = Feast.new(feast_params)
   if @feast.save
      flash[:notice]="the feast has been saved. all participants will get invitations and assignments. hope they answer soon"
      redirect_to(:action=>'list')
    else
      render('new')
    end
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
end

private 

   def feast_params
         params.fetch(:feast, {}).permit(:name, :image, :feast_place, :feast_time,courses_attributes: [:id, :dish_id, :_destroy,:feast_id],participations_attributes: [:id,:feast_id, :user_id, :_destroy],obligations_attributes: [:id, :dish_id, :_destroy, :participation_id])
   end
     
