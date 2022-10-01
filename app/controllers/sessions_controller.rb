class SessionsController < ApplicationController
  def new
    # @user = User.new     // Uncomment this link if using form_for
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged-in successfully"
      redirect_to user
    else
      flash.now[:warning] = "Incorrect email or password"
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged-out"
    redirect_to root_path
  end
end