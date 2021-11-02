module User::Operation
  class Login < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(User, :new)
      step Contract::Build(constant: User::Contract::Login)
    end
    step Nested(Present)
    step Contract::Validate(key: :user)
    step :model!

    def model!(options, params:, **)
      user = User.find_by(email: params[:user][:email])
      if user && user.authenticate(params[:user][:password])
        options['user'] = user
        true
      else
        options['email_pwd_fail'] = 'Login fail'
        false
      end
    end
  end
end
