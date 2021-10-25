module User::Operation
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step :model!
      step Contract::Build(constant: User::Contract::Update)

      def model!(options, params:, **)
        options['model'] = User.find(params[:id])
      end
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
