# frozen_string_literal: true

module Jwt
  class Token
    @@secret_key = ENV.fetch('SECRET_KEY_BASE', nil)
    @@expiration = ENV.fetch('JWT_EXPIRATION_HOUR', nil)

    def self.encode(payload)
      JWT.encode(
        payload.merge('exp' => @@expiration),
        @@secret_key
      )
    end

    def self.decode(token)
      decoded_token = JWT.decode(token, @@secret_key).first
    rescue StandardError
      nil
    end
  end
end
