class User < ApplicationRecord
  has_secure_password
  has_one :journal

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }

end
