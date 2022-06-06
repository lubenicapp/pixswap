# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Puzzles", type: :request do
  before(:each) do
    Puzzle.create(start: '1000000000000000000000000', goal: '0100000000000000000000000')
  end

  after(:each) do
    Puzzle.last.delete
  end

  describe "POST /puzzles/:id/move" do
    context "with valid parameters" do
      it "returns a success status code" do
        post "/puzzles/1/move", params: { direction: "up", line: "1" }
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "POST /puzzles/:id/move" do
    context "with invalid parameters" do
      it "returns a 422 status code" do
        post "/puzzles/1/move"
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
