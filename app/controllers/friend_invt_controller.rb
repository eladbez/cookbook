class FriendInvtController < ApplicationController
  
  def create
    @invite = Invitation.build(:sender_id => session[:user_id], :receiver_id => params[:id])
    if @invite.save
      render('create_ok')
    else @invite.save
      #here mail sending is needed
      render('create_error')
    end
  end

  def destroy
  
  end

end
