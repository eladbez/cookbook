class FeastInvtController < ApplicationController
  
  def create
    @invite = Invitation.build(:sender_id => session[:user_id], :receiver_id => params[:id], :feast_id => session[:feast_id])
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
