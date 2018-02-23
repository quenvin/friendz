class UsersController < ApplicationController
  
  def new
    @user = User.new
  end



  def create
      @username = sign_up_params[:username]
      if usernameexists(@username)
      redirect_to root_path
      else
        super
      end
    end

  def show
    @user = User.find(params[:id])
    @relationship = Relationship.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.update(user_params)
    if @user.find
      flash[:success] = "Username and email successfully updated !"
        redirect_to user_path
    else
      render :edit
    end
  end
  
  private

  def user_params
      params.require(:user).permit( :username , :email)
  end





end
