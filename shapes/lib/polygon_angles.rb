# frozen_string_literal: true

def internal_angle(n)
  if n==0 || n<0
    raise PolygonError, "Angle cannot be '0' or 'negative'"
  end
  (((n-2) * 180).to_f / n).round(2)
end
def external_angle(n)
  (360 / n.to_f).round(2)
end

# # Error class used in invalid_triangle_spec. No need to change this code.
class PolygonError < StandardError
end

RSpec.describe 'polygon angle calculation' do
  context 'with interior angles' do
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

  context 'with exterior angles' do
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

  it 'throws error for polygon with angle = 0' do
    expect(internal_angle(0)).to eq(108)
  end
  it 'throws errors for polygon with negative angles' do
    expect(internal_angle(-20)).to eq(108)
  end
  end

