require 'rails_helper'

RSpec.describe Post, :type => :model do
  subject{
    Post.new(
      title: "This is Rspec Testing",
      description: "This is description for rspec testing.",
      public_flag: 1,
      created_by: 9999
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid. Title is too long." do
    subject.title = 'a' * 256
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid. Title is too short." do
    subject.description = 'a' * 5
    expect(subject).to_not be_valid
  end

  it "is not valid. Title is too long." do
    subject.description = 'a' * 1001
    expect(subject).to_not be_valid
  end

  it "is not valid without a public_flag" do
    subject.public_flag = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a public_flag" do
    subject.created_by = nil
    expect(subject).to_not be_valid
  end
end