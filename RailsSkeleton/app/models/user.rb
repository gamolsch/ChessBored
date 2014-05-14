# require 'bcrypt' | rails automatically requires so no require
class User < ActiveRecord::Base
  validates :email, uniqueness: :true #only unique emails

	include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(login_info)
    this_user = User.find_by_email(login_info[:email])
    if this_user && this_user.password == login_info[:password_hash]
      return this_user.id
    end
  end
end
