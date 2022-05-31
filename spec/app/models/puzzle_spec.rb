require 'rails_helper'

describe Puzzle, type: :model do
  subject(:puzzle) { build(:puzzle, **attributes) }

  let(:attributes) { { start: "1111100000111110000011111",
                       end: "1111100000111110010011011",
                       status: "unsolved"
    }
  }


  describe '#valid?' do
    subject(:status) { puzzle.valid? }

    context 'with valid positions' do
      it { is_expected.to be true }
    end

    context 'with identical positions' do
      let (:attributes) { { start: "1111100000111110000011111",
                            end: "1111100000111110000011111",
                            status: "unsolved"
        }
      }
      it { is_expected.to be false }
    end

    context 'with invalid characters' do
      let (:attributes) { { start: "00000000000000000000000001",
                            end: "X000000000000000000000000",
                            status: "unsolved"
        }
      }
      it { is_expected.to be false }
    end

    context 'with invalid size' do
      let (:attributes) { { start: "01",
                            end: "1111111111111111111111111111000000000000000000000000",
                            status: "unsolved"
      }
      }
      it { is_expected.to be false }
    end
  end
end
