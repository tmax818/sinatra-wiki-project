require 'bcrypt'

class User < ActiveRecord::Base
  validates_presence_of :username, :email, :password
  has_secure_password
  has_many :pages

    include BCrypt


    def password
      @password ||= Password.new(password_digest)
    end

    def password=(new_password)
      @password = Password.create(new_password)
      self.password_digest = @password
    end












end
