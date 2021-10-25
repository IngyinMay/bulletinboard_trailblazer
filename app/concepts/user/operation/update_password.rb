module User::Operation
  class UpdatePassword < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step :model!
      step Contract::Build(constant: User::Contract::UpdatePassword)

      def model!(options, params:, **)
        options['model'] = User.find(options['user_id'])
      end
    end
    step Nested(Present)
    step :assign_updated_by!
    step Contract::Validate(key: :user)
    step Contract::Persist()

    def assign_updated_by!(options, **)
      options[:params][:user][:created_by] = options['user_id']
    end
  end
end
