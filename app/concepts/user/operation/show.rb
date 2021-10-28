module User::Operation
  class Show < Trailblazer::Operation
    step Model(User, :find_by)
  end
end
