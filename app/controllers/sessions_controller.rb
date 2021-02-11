class SessionsController < ApplicationController
  def new
  end

  def create
    if !User.find_by(email:params[:email]).nil?
      user = User.find_by(email:params[:email])
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path
      else
        flash[:danger] = "Mot de passe non valide"
        render :new
      end
    else
      flash[:danger] = "Email non valide"
      render :new
    end  
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
