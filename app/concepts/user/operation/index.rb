module User::Operation
  class Index < Trailblazer::Operation
    step :get_user_list

    def get_user_list(options, **)
      options['users'] = User.all
    end
  end
end
