class UsersController < ApplicationController
  def index
    run User::Operation::Index do |result|
      @users = result[:users]
    end
  end

  def new
    run User::Operation::Create::Present
  end

  def create
    run User::Operation::Create, current_user: current_user do |_result|
      return redirect_to users_path
    end
    render :new
  end

  def show
    run User::Operation::Show
  end

  def edit
    run User::Operation::Update::Present
  end

  def update
    run User::Operation::Update, current_user: current_user do |result|
      return redirect_to user_path(result[:model])
    end
    render :edit
  end

  def destroy
    run User::Operation::Destroy do |_|
      return redirect_to users_path, notice: 'User have been deleted'
    end
  end

  def edit_profile
    run User::Operation::UpdateProfile::Present, user_id: current_user.id
  end

  def update_profile
    run User::Operation::UpdateProfile, user_id: current_user.id do |_|
      return redirect_to profile_users_path
    end
    render :edit_profile
  end

  def edit_password
    run User::Operation::UpdatePassword::Present, user_id: current_user.id
  end

  def update_password
    run User::Operation::UpdatePassword, user_id: current_user.id do |_|
      return redirect_to profile_users_path
    end
    render :edit_password
  end
end
