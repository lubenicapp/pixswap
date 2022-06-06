# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable

  validates :email,
            presence: true,
            uniqueness: true

  def self.find_by_payload(claims)
    find_by(email: claims['sub'], token_revision: claims['revision'])
  end
end
