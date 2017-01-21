module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def is_admin?
    is_role 'admin'
  end

  def is_user?
    is_role 'user'
  end

  private
  def is_role(role)
    if logged_in?
      return current_user.role == role
    end
    return false
  end
end
