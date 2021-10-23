module User::Operation
    class Destroy < Trailblazer::Operation
        step :delete!
        def delete!(options, params:, **)
            User.destroy(params[:id])
        end
    end
  end
