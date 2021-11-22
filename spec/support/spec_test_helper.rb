# spec/support/spec_test_helper.rb
module SpecTestHelper   
  def current_user
    User.where(email:  "superuser1@gmail.com").take
  end
end
