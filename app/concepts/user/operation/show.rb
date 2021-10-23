module User::Operation
    class Show < Trailblazer::Operation
        step :get_user

        def get_user(options, params: , **)
            options["model"] = User.find(params[:id])
        end
    end
  end
