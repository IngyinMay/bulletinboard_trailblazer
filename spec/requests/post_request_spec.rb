require "rails_helper"
RSpec.describe "Post", :type => :request do
  before { allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user) }

  let(:post_params) {
    {
      title: 'RSpec post title',
      description: 'RSpec post descriptioin.',
      public_flag: true,
      created_by: 999
    }
  }

  # post index
  describe 'GET /' do
    scenario 'get post list' do
      get '/'
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end
  end

  # post create
  describe 'POST /posts/new_post' do
    scenario 'valid post create' do
        # send a POST request to /post/create, with these parameters
        post '/posts/new_post', params: { :post =>  post_params }
        post = Post.last
        expect(post.title).to eq('RSpec post title')
        expect(post.description).to eq('RSpec post descriptioin.')
    end
  end

  # post detail
  describe 'GET /posts/show' do
    scenario 'post detail' do
      post = Post.create(post_params)
      get post_path(post)
      expect(response.status).to eq(200)
      expect(response).to render_template(:show)
    end
  end
  
  # post update
  describe 'PUT posts/edit' do
    scenario 'valid post update' do 
      last_post_id = Post.last.id
      put "/posts/#{last_post_id}/edit", params: { post: post_params }
      updated_post = Post.find(last_post_id)
      expect(updated_post.title).to eq('RSpec post title')
      expect(updated_post.description).to eq('RSpec post descriptioin.')
    end

    scenario 'in valid post update' do 
      post_params[:title] = nil
      last_post_id = Post.last.id
      put "/posts/#{last_post_id}/edit", params: { post: post_params }
      updated_post = Post.find(last_post_id)
      expect(updated_post.title).not_to eq('RSpec post title')
      expect(response).to render_template(:edit)
    end
  end

  # post delete
  describe 'DELETE posts/:id' do
    scenario 'delete post' do
      post = Post.create! post_params
      expect {
        delete post_path(post)
      }.to change(Post, :count).by(-1)
    end
  end
end
