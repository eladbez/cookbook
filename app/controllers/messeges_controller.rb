class MessegesController < ApplicationController
  
  def new
    
  end

  def create
    @messege = @messege.new(messege_params)
    if @messege.save
      flash[:notice]="messege sent to #{User.find(@messege.receiver_id).name}"
      redirect_to(:controller => 'user', :action =>'show', :id => @messege.receiver.id)
    else
      render('new')
    end
  end
  
  def list
   # @user= User.find(session[:user_id])
   # @messeges=@user.messeges.order("updated_at DESC").order("news? DESC")
   # @news=@messeges.where(news?='true').order("updated_at DESC")
   # @friend_invt = FriendInvt.where("receiver_id => session[:user_id]".order("updated_at"))
    @fivs = FeastInvt.where(receiver_id: session[:user_id]).where.not(sender_id: session[:user_id]).order("updated_at DESC").to_a
  end
  

  def show
    @messege = Messege.find(params[:id])
  end

  def delete
    @messege = Messege.find(params[:id])
  end

  def destroy
    Messege.find(params[:id]).destroy
    flash[:notice] = "messege deleted."
    redirect_to(:action => 'list')
  end

private
 
  def messege_params
    params.fetch(:dish, {}).permit(:content, :subject, :receiver_id, :sender_id, :news?)    
  end

end

