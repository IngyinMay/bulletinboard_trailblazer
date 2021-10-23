class PostsController < ApplicationController
    before_action :authorized?, except: [:index]

    def index
        run Post::Operation::Index, current_user: current_user
    end

    def new
        run Post::Operation::Create::Present
    end

    def create
        run Post::Operation::Create, current_user: current_user do |_|
          return redirect_to posts_path
        end
        render :new
    end

    def show
        run Post::Operation::Update::Present do |result|
            @post = result[:model]
        end
    end

    def edit
        run Post::Operation::Update::Present
    end

    def update
        run Post::Operation::Update, current_user: current_user do |result|
            return redirect_to post_path(result[:model])
        end
        render :edit
    end

    def destroy
        run Post::Operation::Destroy do |_|
            return redirect_to posts_path, notice: "Post have been deleted"
        end
    end

end
