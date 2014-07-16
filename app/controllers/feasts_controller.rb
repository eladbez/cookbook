class FeastsController < ApplicationController

  def list
    @user_feast_m=Feast.joins(participations: :user).where(participations: {user_id: session[:user_id]}).where(participations: {manager: true}).to_a
    @user_feast_p=Feast.joins(participations: :user).where(participations: {user_id: session[:user_id]}).where(participations: {manager: false}).to_a
  end

  def show
    @feast=Feast.find(params[:id])
    @users=@feast.users.to_a
    @dishes=@feast.dishes.to_a
  end

  def new
   
    @feast= Feast.new
    @feast.participations.build
   
     respond_to do |format| 
      format.html 
      format.js 
     end
  end

  def create
   @feast = Feast.new(feast_params)
   if @feast.save
      flash[:notice]="the feast has been saved. all participants will get invitations and assignments. hope they answer soon"
      
      @feast.users.to_a.each do |u|
       unless u.id == session[:user_id] 
          FeastInvt.create(receiver_id: u.id, sender_id: session[:user_id],feast_id: @feast.id)
       else
          par = u.participations.where(feast_id: @feast.id).to_a
          par.each do |p| 
            p.coming = "coming"
            p.save
          end
        end
      end
    
      redirect_to(:action=>'list')
    else
      render('new')
    end
  end

  def update
    @feast = Feast.find(params[:id])
    if @feast.update_attributes(feast_params)
      flash[:notice] = "feast updated."
      redirect_to(:action => 'list')
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end  
  end

  def edit
    @feast=Feast.find(params[:id])
    @users = User.joins(participations: :feast).where(participations: {feast_id: @feast.id}).order("participations.manager DESC").order("users.name ASC").to_a
    @dishes=@feast.dishes.to_a
    respond_to do |format| 
      format.html 
      format.js 
     end
  end

  def delete
     @feast=Feast.find(params[:id])
  end
  
  def destroy
    feast = Feast.find(params[:id])
    feast.destroy
    flash[:notice] = "feast canceled"
    redirect_to(:action => 'list')
  end


private 

   def feast_params
        # params.require(:feast).permit(:id, :name, :image, :feast_place, :feast_time,courses_attributes: [:id, :dish_id, :_destroy,:feast_id],participations_attributes: [:id,:feast_id, :user_id, :_destroy,manager,obligations_attributes: [:id, :dish_id, :_destroy, :participation_id]])
        params.require(:feast).permit!
   end
     
end