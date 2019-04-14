class User < ApplicationRecord
	has_many :items, dependent: :destroy
	has_secure_password

  validates_presence_of :email, :name, :surname, :password_digest, :role_id
end