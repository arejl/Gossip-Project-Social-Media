class UsersController < ApplicationController
  def welcome
  end
  def show
    @user = User.find(params[:id].to_i)
  end
end
