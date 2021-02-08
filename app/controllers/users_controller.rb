class UsersController < ApplicationController
  def welcome
  end
  def profile
    @user = User.find(params[:user_id].to_i)
  end
end
