# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments
end
