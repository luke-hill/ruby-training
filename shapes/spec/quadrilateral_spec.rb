# frozen_string_literal: true

require 'quadrilateral' # RSpec automatically adds `lib/` to the LOAD_PATH
# edit lib/quadrilateral.rb to fix these tests

RSpec.describe 'quadrilateral types' do
  context 'when valid' do
    it 'is square or rectangle when all angles are the same' do
      expect(quadrilateral(90, 90, 90, 90)).to eq([:square, :rectangle])
    end

    it 'is parallelogram or rhombus when there are 2 pairs of equal angles' do
      expect(quadrilateral(95, 95, 85, 85)).to eq([:parallelogram, :rhombus])
      expect(quadrilateral(120, 60, 120, 60)).to eq([:parallelogram, :rhombus])
      expect(quadrilateral(95, 85, 85, 95)).to eq([:parallelogram, :rhombus])
    end

    it 'is a quadrilateral when no angles are equal' do
      expect(quadrilateral(90, 80, 70, 120)).to eq([:quadrilateral])
      expect(quadrilateral(10, 20, 300, 30)).to eq([:quadrilateral])
      expect(quadrilateral(95, 5, 100, 160)).to eq([:quadrilateral])
    end

    it 'is a quadrilateral when there are not 2 pairs of equal angles' do
      expect(quadrilateral(150, 20, 30, 160)).to eq([:quadrilateral])
      expect(quadrilateral(10, 10, 300, 40)).to eq([:quadrilateral])
      expect(quadrilateral(80, 80, 80, 120)).to eq([:quadrilateral])
    end
  end

  context 'when invalid' do
    it 'throws errors for quadrilaterals with angles of 0' do
      expect { quadrilateral(300, 40, 20, 0) }.to raise_error(QuadrilateralError)
      expect { quadrilateral(300, 60, 0, 0) }.to raise_error(QuadrilateralError)
      expect { quadrilateral(360, 0, 0, 0) }.to raise_error(QuadrilateralError)
      expect { quadrilateral(0, 0, 0, 0) }.to raise_error(QuadrilateralError)
    end

    it 'throws errors for quadrilaterals with negative angles' do
      expect { quadrilateral(300, 40, 30, -10) }.to raise_error(QuadrilateralError)
      expect { quadrilateral(360, 40, -30, -10) }.to raise_error(QuadrilateralError)
      expect { quadrilateral(440, -40, -30, -10) }.to raise_error(QuadrilateralError)
    end

    it 'throws errors for illegal quadrilaterals that are not constructible' do
      expect { quadrilateral(300, 40, 10, 9) }.to raise_error(QuadrilateralError)
      expect { quadrilateral(300, 40, 12, 9) }.to raise_error(QuadrilateralError)
    end
  end
end
