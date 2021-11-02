module User::Operation
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(User, :find_by)
      step Contract::Build(constant: User::Contract::Update)
    end
    step Nested(Present)
    step :assign_current_user!
    step Contract::Validate(key: :user)
    step Contract::Persist()

    def assign_current_user!(options, **)
      options[:params][:user][:updated_by] = options['current_user'][:id]
    end
  end
end
