class UsersController < ApplicationController
  
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	#load up the new page
  	@user = User.new
  	render 'new'
  end
end
