module User::Operation
  class PasswordResetSend < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(PasswordReminder, :new)
      step Contract::Build(constant: User::Contract::PasswordResetSend)
    end
    step Nested(Present)
    step Contract::Validate()
    step :find_user!
    step :remove_existing_tokens!
    step :generate_token!
    step Contract::Persist()
    step :send_password_reset_email

    def find_user!(options, params:, **)
      options['user'] = User.find_by_email(params['email'])
    end

    def remove_existing_tokens!(options, params:, **)
      PasswordReminder.delete_by(user_id: options['user'].id)
    end

    def generate_token!(options, params:, **)
      options['model']['token'] = SecureRandom.urlsafe_base64
      options['model']['expires_at'] = Time.now + 1.hour
      options['model']['user_id'] = options['user'].id
    end

    def send_password_reset_email(options, params:, **)
      UserMailer.password_reset(options['model']).deliver_later
    end
  end
end
  