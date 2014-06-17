class MessegesController < ApplicationController
  def new
    @messege = Messege.build
  end

  def create
    @messege = @messege.build(messege_params)
    if @messege.save
      flash[:notice]="messege sent to #{find(User.(@messege.receiver_id).name}"
      redirect_to(:controller => 'user', :action =>'show', :id => @messege.receiver.id)
    else
      render('new')
  end

  def list
    @user= User.find(session[:user_id])
    @messeges=@user.messeges.order("updated_at DESC").order("news? DESC")
    @news=@messeges.where(news?='true').order("updated_at DESC")
    @friend_invt = FriendInvt.where("receiver_id => session[:user_id]".order("updated_at"))
    @feast_invt = FeastInvt.where("receiver_id => session[:user_id]".order("updated_at"))
  end
  

  def show
    @messege = Messege.find(params[:id])
  end

  def delete
    @messege = Messege.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "messege deleted."
    redirect_to(:action => 'list')
  end

private
 
  def messege_params
    params.fetch(:dish, {}).permit(:content, :subject, :receiver_id, :sender_id, :news?)    


end

