# frozen_string_literal: true

module Devise
  module Strategies
    ##
    # Devise authentication strategy based on JSON Web Token.
    class JwtAuthenticatable < Devise::Strategies::Base
      BEARER = 'Bearer'

      def valid?
        return false unless request.headers['Authorization'].present?

        strategy&.casecmp?(BEARER) && raw_token&.present?
      end

      def authenticate!
        return fail! unless jwt_token

        found_user = User.find_by_payload(jwt_token.payload)

        success! found_user
      end

      private

      def jwt_token
        @jwt_token ||= Authentication::Token.decode(token: raw_token)
      end

      def strategy
        request.headers['Authorization'].split.first&.strip
      end

      def raw_token
        request.headers['Authorization'].split[1]&.strip
      end
    end
  end
end
