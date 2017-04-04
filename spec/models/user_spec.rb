require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a vaild user factory"

  it "is valid with a name, email, and password_digest"

  it "is invalid without a name"

  it "is invalid without a emial"

  it "is invalid without a password"

  it "is only vaild when a password length is a minimum of 8 characters"

  it "encrypts the password upon saving"
end
