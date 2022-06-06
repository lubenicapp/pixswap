# frozen_string_literal: true

class TokensController < ApplicationController
  before_action :authenticate_user!, only: [:sign_in]

  def sign_in
    head 206
  end

  def token_sign_in
    head 201
  end
end
