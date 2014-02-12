class UsersController < ApplicationController
  
  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    
    if @user.valid?
      redirect_to user_path(@user)
    else
      render(:new)
    end
  end

  def show
  end

  def edit
    @update_worked = true
  end

  def update
    @update_worked = @user.update(user_params)
    
    if @update_worked
      redirect_to user_path(@user)
    else
      render(:edit)
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def load_user
    return @user = User.find(params[:id])
  end

  def user_params

    if params[:password].empty?
      return {
        email: params[:email],
        first_name: params[:first_name],
        last_name: params[:last_name],
        dob: params[:dob],
        gender: params[:gender],
        facebook_link: params[:facebook_link]
      }
    else
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

    #params.require(:user).permit(:email, :first_name,
    #  :last_name, :dob, :gender, :facebook_link)

  end

end