# frozen_string_literal: true

require 'quadrilateral' # RSpec automatically adds `lib/` to the LOAD_PATH
# edit lib/quadrilateral.rb to fix these tests

RSpec.describe 'handling errors' do
  it 'throws errors for quadrilaterals with angles of 0' do
    expect { quadrilateral(300, 40, 20, 0) }.to raise_error(QuadrilateralError)
    expect { quadrilateral(300, 60, 0, 0) }.to raise_error(QuadrilateralError)
    expect { quadrilateral(360, 0, 0, 0) }.to raise_error(QuadrilateralError)
    expect { quadrilateral(0, 0, 0, 0) }.to raise_error(QuadrilateralError)
  end

  it 'throws errors for quadrilaterals with negative angles' do
    expect { quadrilateral(300, 40, 30, -10) }
      .to raise_error(QuadrilateralError)
    expect { quadrilateral(360, 40, -30, -10) }
      .to raise_error(QuadrilateralError)
    expect { quadrilateral(440, -40, -30, -10) }
      .to raise_error(QuadrilateralError)
  end

  it 'throws errors for illegal quadrilaterals that are not constructable' do
    expect { quadrilateral(300, 40, 10, 9) }.to raise_error(QuadrilateralError)
    expect { quadrilateral(300, 40, 12, 9) }.to raise_error(QuadrilateralError)
  end
end
