# frozen_string_literal: true

module Authentication
  class Token
    SECRET_KEY = ENV.fetch('SECRET_KEY_BASE', nil)
    EXPIRATION = ENV.fetch('JWT_EXPIRATION_HOUR', nil)

    def self.encode(payload)
      JWT.encode(
        payload.merge('exp' => EXPIRATION.to_i.hours.from_now.to_i),
        SECRET_KEY
      )
    end

    def self.decode(raw_token)
      JWT.decode(raw_token, SECRET_KEY)
    rescue StandardError
      nil
    end
  end
end
