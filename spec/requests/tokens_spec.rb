# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Tokens", type: :request do
  include Warden::Test::Helpers
  before(:each) do
    User.create(email: Digest::SHA256.hexdigest(Time.now.getutc.to_s), password: "123456")
  end

  after(:each) do
    User.last.delete
  end

  let(:user) { User.last }

  describe "POST /sign_in" do
    context "when accessed with valid credientials" do
      before { login_as user }
      it "returns a token" do
        post "/sign_in"
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['token']).not_to be_nil
      end
    end

    context "when not logged" do
      it "fails" do
        post "/sign_in"
        expect(response.status).not_to eq(:success)
      end
    end
  end

  describe "POST /sign_out" do
    context "when accessed with valid credentials" do
      before { login_as user }
      it "increase the user's token_revision" do
        post "/sign_out"
        expect(user.token_revision).to eq(1)
      end
    end
  end

end
