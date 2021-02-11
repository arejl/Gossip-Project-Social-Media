class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(first_name:params[:first_name], last_name:params[:last_name], email:params[:email], password:params[:password] )
    if !City.find_by(city_name:params[:city_name].capitalize).nil?
      @user.city = City.find_by(city_name:params[:city_name].capitalize)
    else
      @user.city = City.create(city_name:params[:city_name].capitalize)
    end
    if @user.save
      redirect_to(root_path)
    else
      render :new   
    end
  end
  def welcome
  end
  def show
    @user = User.find(params[:id].to_i)
  end
end
