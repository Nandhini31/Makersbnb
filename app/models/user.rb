require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource

  attr_reader :password

  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true
  property :first_name, String
  property :surname, String
  property :password_digest, Text, required: true

  def password=(password)
    @password = password
    self.password_digest = Password.create(password)
  end

  def self.authenticate(email,password)
    user = User.first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
