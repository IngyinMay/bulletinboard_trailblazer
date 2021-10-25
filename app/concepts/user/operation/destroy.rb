module User::Operation
  class Destroy < Trailblazer::Operation
    step :delete!
    def delete!(_options, params:, **)
        User.destroy(params[:id])
    end
  end
end
