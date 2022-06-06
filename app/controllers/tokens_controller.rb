# frozen_string_literal: true

class TokensController < ApplicationController
  before_action :authenticate_user!

  def sign_in
    payload = { 'email' => current_user.email }
    @token = Authentication::Token.encode(payload:)
  end

  def sign_out
    user = current_user
    user.token_revision += 1
    user.save
  end

  def token_sign_in
    head 201
  end
end
