class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_user, except: [:new, :create]
  before_action :require_same_user, only: [:show, :edit]

  def index
    @users = policy_scope(User)
    @active_link = 'users'
  end

  def show
  end

  def new
    authorize User
    @user = User.new
    @active_link = 'users'
  end

  def create
    authorize User
    @user = User.new(user_params)
    if @user.save
      session[:user_uuid] = @user.id
      flash[:success] = "Welcome to Spendee #{@user.name}, you have successfully create a new account"
      redirect_to users_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @active_link = 'users'
  end

  def update
    authorize User
    if @user.update(user_params)
      flash[:success] = "Your account information was successfully updated"
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      redirect_to current_user
    end
  end
end