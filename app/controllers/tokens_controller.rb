# frozen_string_literal: true

class TokensController < ApplicationController
  before_action :authenticate_user!, only: [:sign_in]

  def sign_in
    head 204
  end
end
