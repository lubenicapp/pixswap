# frozen_string_literal: true

module Devise
  module Strategies
    class JwtAuthenticatable < Devise::Strategies::Base
      def valid?
        api_token.present?
      end

      def authenticate!
        return fail! unless api_token

        user = User.find_by_payload(api_token:)
        success! user
      end

      private

      def api_token
        env['HTTP_AUTHORIZATION'].to_s.remove('Bearer ')
      end
    end
  end
end


