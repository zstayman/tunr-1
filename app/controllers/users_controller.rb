class UsersController < ApplicationController
  
  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
    @user = User.create(user_params)
    redirect_to "/users/#{@user.id}"
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to "/users/#{@user.id}"
  end

  def destroy
    @user.destroy
    redirect_to "/"
  end

  private

  def load_user
    return @user = User.find(params[:id])
  end

  def user_params
    return {
      email: params[:email],
      first_name: params[:first_name],
      last_name: params[:last_name],
      dob: params[:dob],
      gender: params[:gender],
      facebook_link: params[:facebook_link],
      password: params[:password]
    }
  end

end