class ParticipationController < ApplicationController
  
  def create
    @par = Participation.build(:feast_id => f_id, :user_id => params[:user_id], :status =>"invitation sent")
    if @par.save
      render('create_ok')
    else @par.save
      #here mail sending is needed
      render('ceate_error')
    end
  end
  
   def destroy
    par = par.find(params[:id])
    par.destroy
    redirect_to :back
  end
end
