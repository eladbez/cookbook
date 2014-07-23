class FeastsController < ApplicationController

  def list
    @user_feast_m=Feast.joins(participations: :user).where(participations: {user_id: session[:user_id],manager: true}).to_a
    @user_feast_p=Feast.joins(participations: :user).where(participations: {user_id: session[:user_id],manager: false}).to_a
  end

  def show
    @feast=Feast.find(params[:id])
    @users=@feast.users.to_a
    @dishes=@feast.dishes.to_a
  end

  def new
     respond_to do |format| 
      format.html {@feast = Feast.new
                   @feast.participations.build
                   }
      format.js 
     end
  end

  def create
   @feast = Feast.new(feast_params)
   if @feast.save
      flash[:notice]="the feast has been saved. all participants will get invitations and assignments. hope they answer soon"
      
      # creates new participants invitations
      @feast.users.distinct.to_a.each do |u|
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
      unless params[:invtupdate]
        flash[:notice] = "feast updated."
      # creates new participants invitations
        
        @feast.users.distinct.to_a.each do |u|
            unless u.id == session[:user_id]
              pars = u.participations.where(feast_id: @feast.id).to_a
              if one_unpersisted?(pars)
                 FeastInvt.create(receiver_id: u.id, sender_id: session[:user_id],feast_id: @feast.id)
              end
            end        
          end
       else
         FeastInvt.find(params[:fiv_id]).update_attributes(answered: true)  
       end
      
      respond_to do |format| 
        format.html {redirect_to(:action => 'list')}
        format.js 
        # attention!!!! normal edit view template uses ajax
        # through new controller thus new.js NOT edit.js
        # only post feast invitations answers submittion uses update.js
       end
    else
      # if save fails it will render edit or js
      unless params[:pars] 
        render('edit')
      else
        render(controller: 'posts', action: 'index')
      end
    end  
  end

  def edit
    respond_to do |format| 
      format.html{ 
        @edit = true
        @feast = Feast.find(params[:id])
        @users = User.joins(participations: :feast).where(participations: {feast_id: @feast.id}).order("participations.manager DESC").order("users.name ASC").to_a
        @dishes = @feast.dishes.to_a
        }
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
         params.require(:feast).permit(:id, :name, :image, :feast_place, :feast_time,courses_attributes: [:id, :dish_id, :_destroy,:feast_id],participations_attributes: [:id,:feast_id, :user_id, :_destroy,:manager,:coming,obligations_attributes: [:id, :dish_id, :_destroy, :participation_id,:agreed]])
   end
     
end


          