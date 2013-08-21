class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]

   def index
   @users = User.paginate(page: params[:page])
 

   end
   
  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  

  def create
  	#load up the new page
  	@user = User.new(params[:user])
    if @user.save
      sign_in(@user)
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user_path(@user)
    else
     render 'new'
   end
 end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      sign_in @user
      flash[:success] = "You have successfully updated your profile!"
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  

  private

    def signed_in_user
      # a way to debug
      # raise signed_in?.inspect
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "You must sign in first" 
    end
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end
end
