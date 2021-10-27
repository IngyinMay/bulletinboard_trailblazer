class UsersController < ApplicationController
  #function: index
  #show user list
  def index
    run User::Operation::Index do |result|
      @users = result[:users]
    end
  end

  # function: new
  # show user create form
  def new
    run User::Operation::Create::Present
  end

  # function: create
  # create user
  # params: user
  def create
    run User::Operation::Create, current_user: current_user do |_result|
      return redirect_to users_path
    end
    render :new
  end


  # function: show
  # show user detail page
  # params: id
  def show
    run User::Operation::Show
  end

  # function: edit
  # show user edit form
  # params: id
  def edit
    run User::Operation::Update::Present
  end

  # function: update
  # update user
  # params: user, id
  def update
    run User::Operation::Update, current_user: current_user do |result|
      return redirect_to user_path(result[:model])
    end
    render :edit
  end

  # function: destroy
  # destroy user
  # params: id
  def destroy
    run User::Operation::Destroy do |_|
      return redirect_to users_path, notice: 'User have been deleted'
    end
  end

  # function: edit_profile
  # show edit profile page
  # edit profile
  def edit_profile
    run User::Operation::UpdateProfile::Present, user_id: current_user.id
  end

  # function: update_profile
  # update profile
  # params: user
  def update_profile
    run User::Operation::UpdateProfile, user_id: current_user.id do |_|
      return redirect_to profile_users_path
    end
    render :edit_profile
  end

  # function: edit_password
  # show password edit page
  def edit_password
    run User::Operation::UpdatePassword::Present, user_id: current_user.id
  end

  # function: update_password
  # update password
  def update_password
    run User::Operation::UpdatePassword, user_id: current_user.id do |_|
      return redirect_to profile_users_path
    end
    render :edit_password
  end
end
