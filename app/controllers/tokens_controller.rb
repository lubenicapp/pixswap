# frozen_string_literal: true

class TokensController < ApplicationController
  before_action :authenticate_user!, except: [:token_sign_in]

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

  def token_sign_in
    raw_token = request.headers['Authorization'].split(' ')[1]
    puts "decoded #{Authentication::Token.decode(raw_token)}"
    head 201
  end
end
