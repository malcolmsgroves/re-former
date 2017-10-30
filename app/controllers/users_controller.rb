class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  # app/controllers/users_controller.rb
  def create
    #@user = User.new(name: params[:name],
                     #email: params[:email],
                     #password: params[:password])
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "User successfully created"
      redirect_to new_user_path
    else
      flash.now[:notice] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "User successfully updated"
      redirect_to @user
    else
      flash.now[:notice] = @user.errors.full_messages
      render 'edit'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
