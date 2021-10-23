module Post::Operation
    class Destroy < Trailblazer::Operation
        step :delete!
        def delete!(options, params:, **)
            Post.destroy(params[:id])
        end
    end
  end