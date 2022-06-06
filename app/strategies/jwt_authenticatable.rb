# frozen_string_literal: true

class JwtAuthenticatable < Warden::Strategies::Base
  def valid?
    api_token.present?
  end

  def authenticate!
    user = User.find_by_token(api_token:)
    success! user
  end

  private

  def api_token
    env['HTTP_AUTHORIZATION'].to_s.remove('Bearer ')
  end
end
