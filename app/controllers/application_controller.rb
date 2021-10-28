class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def authorized?
    redirect_to login_path unless logged_in?
  end

  def can_create
    current_user.super_user_flag || current_user.role == Constants::USER_ROLES['Level1']
  end

  def can_edit(post)
    current_user.super_user_flag || (post.created_by == current_user.id && current_user.role == Constants::USER_ROLES['Level1'])
  end

  def check_resource(resource)
    if resource 
      true
    else 
      render :file => Rails.root.join('public', '404.html'),  :status => 404
    end
  end

  helper_method :current_user, :logged_in?, :can_create, :can_edit
end
