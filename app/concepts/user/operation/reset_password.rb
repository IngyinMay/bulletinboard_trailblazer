module User::Operation
  class ResetPassword < Trailblazer::Operation
    step Model(PasswordReminder, :find_by, :token)
    step Contract::Build(constant: User::Contract::ResetPassword)
    step Contract::Validate()
    step :generate_password!
    step :delete_reminder!

    def generate_password!(options, model:, params:, **)
      model.user.password_digest = BCrypt::Password.create(params['password'])
      model.user.save()
    end

    def delete_reminder!(options, model:, **)
      model.destroy
    end
  end
end
