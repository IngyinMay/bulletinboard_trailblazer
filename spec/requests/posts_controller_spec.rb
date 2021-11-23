require "rails_helper"
RSpec.describe PostsController, type: :controller do
  before { allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user) }

  let(:post_params) {
    {
      title: 'RSpec post title',
      description: 'RSpec post descriptioin.',
      public_flag: true,
      created_by: 999
    }
  }

  # function :index
  describe "GET posts#index" do
    it "get all posts" do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end
  end

  # function :create
  describe "POST posts#create" do
    context "valid post param" do
      it "create posts" do
        post :create, params: { :post =>  post_params }
        post = Post.last
        expect(post.title).to eq('RSpec post title')
        expect(post.description).to eq('RSpec post descriptioin.')
        expect(response).to redirect_to(posts_path)
        expect(response.content_type).to eq "text/html; charset=utf-8"
      end
    end
    context "invalid post param" do
      it "create posts" do
        post_params[:title] = nil
        post :create, params: { :post =>  post_params }
        expect(assigns(:form).errors[:title][0]).to eq "can't be blank"
        expect(response).to render_template(:new)
      end
    end
  end

  # function :show
  describe "GET posts#show" do
    it "show post detail" do
      last_post = Post.last
      get :show, params: { :id => last_post.id }
      expect(response.status).to eq(200)
      expect(response).to render_template(:show)
      expect(assigns(:post)).not_to be_nil
      expect(assigns(:post).title).to eq last_post.title
    end
  end

  # function :update
  describe "PUT posts#update" do
    context "valid post param" do 
      it "update post" do
        last_post = Post.last
        put :update, params: { :post => post_params , :id => last_post.id }
        expect(flash[:notice]).to eq('Post has been updated')
        expect(assigns(:model).title).to eq "RSpec post title"
      end
    end
    context "invalid post param" do
      it "update post" do
        last_post = Post.last
        post_params[:title] = nil
        put :update, params: { :post => post_params , :id => last_post.id }
        expect(assigns(:form).errors[:title][0]).to eq "can't be blank"
        expect(response).to render_template(:edit)
      end
    end 
  end

  # function :destroy
  describe "DELETE posts#destroy" do
    it "delete post" do
      post = Post.create! post_params
      expect {
        delete :destroy, params: { :id => post.id }
      }.to change(Post, :count).by(-1)
      expect(flash[:notice]).to eq('Post has been deleted')
    end
  end

  # function :filter
  describe "GET post#filter" do
    context "filter all post from database" do
      it "filter all posts " do
        get :filter, params: { :filter_by => 1}
        expect(response.status).to eq(200)
        expect(response).to render_template(:index)
        expect(assigns(:last_filter_by)).to eq "1"
      end
    end

    context "filter posts created by current user from database" do
      it "filter posts created_by current user " do
        get :filter, params: { :filter_by => 2 }
        assigns(:model).each  do |post|
          expect(post.created_by).to eq current_user.id
        end
      end
    end

    context "filter posts not created by current user from database" do
      it "filter posts not created_by current user " do
        get :filter, params: { :filter_by => 3 }
        assigns(:model).each  do |post|
          expect(post.created_by).not_to eq current_user.id
        end
      end
    end
  end
end