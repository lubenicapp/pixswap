# frozen_string_literal: true

require 'rails_helper'

describe Puzzle, type: :model do
  subject(:puzzle) { build(:puzzle, **attributes) }

  let(:attributes) {
    { start: "1111100000111110000011111",
      goal: "1111100000111110010011011", }
  }

  describe '#valid?' do
    subject(:status) { puzzle.valid? }

    context 'with valid positions' do
      it { is_expected.to be true }
    end

    context 'with identical positions' do
      let(:attributes) {
        { start: "1111100000111110000011111",
          goal: "1111100000111110000011111",  }
      }
      it { is_expected.to be false }
    end

    context 'with invalid characters' do
      let(:attributes) {
        { start: "00000000000000000000000001",
          goal: "X000000000000000000000000",  }
      }
      it { is_expected.to be false }
    end

    context 'with invalid size' do
      let(:attributes) {
        { start: "01",
          goal: "1111111111111111111111111111000000000000000000000000", }
      }
      it { is_expected.to be false }
    end
  end

  describe '#line' do
    subject(:line) { puzzle.line(index) }
    let(:attributes) { { current: "1111100000111110000011111" } }
    let(:index) { 0 }
    context 'with a simple matrix' do
      it { is_expected.to eq('11111') }
    end
  end

  describe '#column' do
    subject(:column) { puzzle.column(index) }
    let(:attributes) { { current: "1000010000100001000010000" } }
    let(:index) { 0 }
    context 'with a simple matrix' do
      it { is_expected.to eq('11111') }
    end
  end

  describe '#transpose' do
    subject(:transpose) { puzzle.transpose }
    let(:attributes) { { current: "12345frere72345frere12345" } }
    context 'when called' do
      it 'transpose the matrix' do
        transpose
        expect(puzzle.current).to eq("1f7f12r2r23e3e34r4r45e5e5")
      end
    end
  end

  describe '#shift_line_left' do
    subject(:shift_row_left) { puzzle.shift_row_left(args) }
    let(:attributes) { { current: "1000000000000000000000000" } }
    let(:args) { 0 }
    it 'offsets the given line by one' do
      shift_row_left
      expect(puzzle.current).to eq("0000100000000000000000000")
    end
  end

  describe '#shift_line_right' do
    subject(:shift_row_right) { puzzle.shift_row_right(args) }
    let(:attributes) { { current: "1000000000000000000000000" } }
    let(:args) { 0 }
    it 'offsets the given line by one' do
      shift_row_right
      expect(puzzle.current).to eq("0100000000000000000000000")
    end
  end

  describe '#shift_column_up' do
    subject(:shift_column_up) { puzzle.shift_column_up(args) }

    context "when called on first column" do
      let(:attributes) { { current: "1000000000000000000000000" } }
      let(:args) { 0 }
      it 'offsets the given column by one' do
        shift_column_up
        expect(puzzle.current).to eq("0000000000000000000010000")
      end
    end

    context "when called on second column" do
      let(:attributes) { { current: "0100000000000000000000000" } }
      let(:args) { 1 }
      it 'offsets the given column by one' do
        shift_column_up
        expect(puzzle.current).to eq("0000000000000000000001000")
      end
    end

    context "when called on third column" do
      let(:attributes) { { current: "0010000000000000000000000" } }
      let(:args) { 2 }
      it 'offsets the given column by one' do
        shift_column_up
        expect(puzzle.current).to eq("0000000000000000000000100")
      end
    end

    context "when called on fourth column" do
      let(:attributes) { { current: "0001000010000000000000000" } }
      let(:args) { 3 }
      it 'offsets the given column by one' do
        shift_column_up
        expect(puzzle.current).to eq("0001000000000000000000010")
      end
    end

    context "when called on fifth column" do
      let(:attributes) { { current: "0000100001000000000000000" } }
      let(:args) { 4 }
      it 'offsets the given column by one' do
        shift_column_up
        expect(puzzle.current).to eq("0000100000000000000000001")
      end
    end
  end

  describe '#shift_column_down' do
    subject(:shift_column_down) { puzzle.shift_column_down(args) }
    let(:attributes) { { current: "1111100000000000000000000" } }
    context 'when called on the first column' do
      let(:args) { 0 }
      it 'offsets the given column by one' do
        shift_column_down
        expect(puzzle.current).to eq("0111110000000000000000000")
      end
    end

    context 'when called on the second column' do
      let(:args) { 1 }
      it 'offsets the given column by one' do
        shift_column_down
        expect(puzzle.current).to eq("1011101000000000000000000")
      end
    end

    context 'when called on the third column' do
      let(:args) { 2 }
      it 'offsets the given column by one' do
        shift_column_down
        expect(puzzle.current).to eq("1101100100000000000000000")
      end
    end
  end
end
