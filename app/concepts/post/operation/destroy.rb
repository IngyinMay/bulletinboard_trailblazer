module Post::Operation
  class Destroy < Trailblazer::Operation
    step :delete!

    def delete!(_options, params:, **)
      Post.destroy(params[:id])
    end
  end
end
