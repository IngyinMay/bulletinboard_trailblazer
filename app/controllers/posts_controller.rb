class PostsController < ApplicationController
  before_action :authorized?, except: [:index]

  # show post list
  def index
    run Post::Operation::Index, current_user: current_user
  end

  # function: new
  # show post create form
  def new
    run Post::Operation::Create::Present
  end

  # function: create
  # create post
  # params: post
  def create
    run Post::Operation::Create, current_user: current_user do |_|
      return redirect_to posts_path
    end
    render :new
  end

  # function: show
  # show post detail page
  # params: id
  def show
    run Post::Operation::Update::Present do |result|
      @post = result[:model]
    end
    check_resource(@post)
  end

  # function: edit
  # show post edit form
  # params: id
  def edit
    run Post::Operation::Update::Present
    check_resource(result[:model])
  end

  # function: update
  # update post
  # params: post, id
  def update
    run Post::Operation::Update, current_user: current_user do |result|
      return redirect_to post_path(result[:model])
    end
    render :edit
  end

  # function: destroy
  # destroy post
  # params: id
  def destroy
    run Post::Operation::Destroy do |_|
      return redirect_to posts_path, notice: 'Post have been deleted'
    end
  end
end
