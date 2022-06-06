# frozen_string_literal: true

class TokensController < ApplicationController
  before_action :authenticate_user!, only: [:sign_in]
  before_action :jwt_authentication!, only: [:token_sign_in]

  def sign_in
    head 204
  end

  def token_sign_in
    head 201
  end
end
