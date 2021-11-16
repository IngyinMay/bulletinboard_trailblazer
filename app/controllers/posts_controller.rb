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

  # function: export
  # download post list csv
  # @return [<Type>] <csv>
  def export
    run Post::Operation::Export::CsvData do |result|
      respond_to do |format|
        format.html
        format.csv { send_data result[:csv_text],  :filename => "post_list.csv" }
      end
    end
  end

  # function: csv_format
  # download post_csv format for upload
  # @return [<Type>] <csv>
  def csv_format
    run Post::Operation::Export::Format do |result|
      respond_to do |format|
        format.html
        format.csv { send_data result[:csv_format],  :filename => "format.csv" }
      end
    end
  end

  # function: action_import
  # import post csv
  def action_import
    run Post::Operation::Import, current_user_id: current_user.id do |_|
      return redirect_to posts_path, notice: Messages::UPLOAD_SUCCESSFUL
    end
    @errors = result["contract.default"].errors
    render :import
    return
  end

  # function: filter
  # filter posts by dropdown list
  # @return [<Type>] <post>
  def filter
    run Post::Operation::Filter, current_user_id: current_user.id do |result|
      @last_filter_by = result[:last_filter_by]
      render :index
      return
    end
  end

  # function: search
  # search post by keyword
  # @return [<Type>] <post>
  def search
    run Post::Operation::Filter::Search do |result|
      @last_search_keyword = result[:last_search_keyword]
      render :index
      return
    end
  end
end
