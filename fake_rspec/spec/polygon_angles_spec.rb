# frozen_string_literal: true

require 'polygon_angles' # RSpec automatically adds `lib/` to the LOAD_PATH
# edit lib/polygon_angles.rb to fix these tests

RSpec.describe 'polygon angle calculation' do
  context 'with an interior angle' do
    it 'calculates the interior angle of a regular pentagon' do
      expect(internal_angle(5)).to eq(108)
    end

    it 'calculates the interior angle of a regular hexagon' do
      expect(internal_angle(6)).to eq(120)
    end

    it 'calculates the interior angle of a regular heptagon' do
      expect(internal_angle(7)).to eq(128.57)
    end

    it 'calculates the interior angle of a regular octagon' do
      expect(internal_angle(8)).to eq(135)
    end

    it 'calculates the interior angle of a regular nonagon' do
      expect(internal_angle(9)).to eq(140)
    end

    it 'calculates the interior angle of a regular decagon' do
      expect(internal_angle(10)).to eq(144)
    end
  end

  context 'with an exterior angle' do
    it 'calculates the exterior angle of a regular pentagon' do
      expect(external_angle(5)).to eq(72)
    end

    it 'calculates the exterior angle of a regular hexagon' do
      expect(external_angle(6)).to eq(60)
    end

    it 'calculates the exterior angle of a regular heptagon' do
      expect(external_angle(7)).to eq(51.43)
    end

    it 'calculates the exterior angle of a regular octagon' do
      expect(external_angle(8)).to eq(45)
    end

    it 'calculates the exterior angle of a regular nonagon' do
      expect(external_angle(9)).to eq(40)
    end

    it 'calculates the exterior angle of a regular decagon' do
      expect(external_angle(10)).to eq(36)
    end
  end
end
