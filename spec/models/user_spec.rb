require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a vaild user factory, name, email, and password" do
    expect(build(:user)).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:user, name: nil )).not_to be_valid
  end

  it "is invalid without a emial" do
    expect(build(:user, email: nil )).not_to be_valid
end

  it "is invalid without a password" do
    expect(build(:user, password_digest: nil )).not_to be_valid

  end

  it "is only vaild when a password length is a minimum of 8 characters"

  it "encrypts the password upon saving"
end
