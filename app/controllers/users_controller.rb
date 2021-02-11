class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(first_name:params[:first_name], last_name:params[:last_name], age:params[:age].to_i, description:params[:description], email:params[:email], password:params[:password], password_confirmation:params[:password_confirmation] )
    if !City.find_by(city_name:params[:city_name]).nil?
      @user.city = City.find_by(city_name:params[:city_name])
    else
      @user.city = City.create(city_name:params[:city_name])
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
