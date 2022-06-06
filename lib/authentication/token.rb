# frozen_string_literal: true

module Authentication
  class Token
    @@secret_key = ENV.fetch('SECRET_KEY_BASE', nil)
    @@expiration = ENV.fetch('JWT_EXPIRATION_HOUR', nil)

    def self.encode(payload)
      JWT.encode(
        payload.merge('exp' => @@expiration.to_i.hours.from_now.to_i),
        @@secret_key
      )
    end

    def self.decode(raw_token)
      decoded_token = JWT.decode(raw_token, @@secret_key)
    rescue StandardError
      nil
    end
  end
end
