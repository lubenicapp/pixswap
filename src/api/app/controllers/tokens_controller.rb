# frozen_string_literal: true

class TokensController < ApplicationController
  before_action :authenticate_user!

  def sign_in
    payload = { 'email' => current_user.email, 'token_revision' => current_user.token_revision }
    @token = Authentication::Token.encode(payload:)
  end

  def sign_out
    user = current_user
    user.token_revision += 1
    user.save
    head 204
  end
end
