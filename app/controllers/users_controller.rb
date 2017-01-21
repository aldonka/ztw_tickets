class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = 'admin'

    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if logged_in?
      @user = User.find(current_user.id)
    else
      respond_to do |format|
        format.html { redirect_to static_pages_home_path, notice: 'Proszę się zalogować, by mieć dostęp do konta.' }
        format.json { head :no_content }
      end
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
