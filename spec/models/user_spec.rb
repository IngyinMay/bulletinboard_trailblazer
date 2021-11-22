require 'rails_helper'

RSpec.describe User, :type => :model do
  subject{
    User.new(
      name: "Rspec test user",
      email: "rspectest@gmail.com",
      password: "P@ssw0rd",
      password_confirmation: "P@ssw0rd",
      phone: "0999999999",
      address: "rspec address",
      super_user_flag: true,
      birthday: "1999-10-10"
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid. Name is too long." do
    subject.name = 'a' * 101
    expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid. Wrong email format" do
    subject.email = "wrongemail"
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "is not valid. Password doesn't match password confirmation" do
    subject.password = "password"
    expect(subject).to_not be_valid
  end

  it "is not valid without a password confirmation" do
    subject.password_confirmation = nil
    expect(subject).to_not be_valid
  end

  it "is not valid. Phone must be numeric" do
    subject.phone = 'phone_text'
    expect(subject).to_not be_valid
  end

  it "is not valid. Phone is too short" do
    subject.phone = "0999999"
    expect(subject).to_not be_valid
  end

  it "is not valid. Phone is too long" do
    subject.phone = "09999999999999"
    expect(subject).to_not be_valid
  end

  it "is not valid. Address is too long" do
    subject.address = "a" * 256
    expect(subject).to_not be_valid
  end

  it "is not valid without superuser falg" do
    subject.super_user_flag = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid. Super user flag is not included in list" do
    subject.super_user_flag = 0
    expect(subject).to_not be_valid
  end

end