# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Puzzles", type: :request do
  include Warden::Test::Helpers
  before(:each) do
    Puzzle.create(start: '1000000000000000000000000', goal: '0100000000000000000000000')
    User.create(email: Digest::SHA256.hexdigest(Time.now.getutc.to_s), password: "123456")
  end

  after(:each) do
    Puzzle.last.delete
    User.last.delete
  end

  let(:user) { User.last }

  describe "POST /puzzles/:id/move" do
    context "with valid parameters as a valid user" do
      before { login_as user }
      it "returns a success status code" do
        post "/puzzles/1/move", params: { direction: "up", line: "1" }
        expect(response).to have_http_status(:success)
      end
    end

    context "with invalid parameters as a valid user" do
      before { login_as user }
      it "returns a 422 status code" do
        post "/puzzles/1/move"
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "with invalid credentials" do
      it "does not perform" do
        post "/puzzles/1/move"
        expect(response).not_to have_http_status(:success)
      end
    end
  end
end
