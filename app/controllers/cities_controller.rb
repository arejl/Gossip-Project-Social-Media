class CitiesController < ApplicationController
  include CitiesHelper
  def show
    @city = City.find(params[:id].to_i)
  end
end
