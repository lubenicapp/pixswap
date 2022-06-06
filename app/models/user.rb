# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable

  validates :email,
            presence: true,
            uniqueness: true

  def self.find_by_payload(claims)
    find_by(email: claims['email'], token_revision: claims['token_revision'])
  end
end
