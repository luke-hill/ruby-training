# frozen_string_literal: true

require 'number_validator' # RSpec automatically adds `lib/` to the LOAD_PATH
# edit lib/number_validator.rb to fix these tests

RSpec.describe NumberValidator do
  subject(:validation) { described_class.new }

  context 'with an integer' do
    it 'validates odd numbers' do
      [-1, 1, 3, 5, 7, 9, 101, 103].each do |number|
        expect(validation.validate(number)).to include(:odd)
      end
    end

    it 'validates even numbers' do
      [-2, 0, 2, 4, 6, 80, 100, 102].each do |number|
        expect(validation.validate(number)).to include(:even)
      end
    end

    it 'validates multiples of 3' do
      [-3, 0, 3, 9, 12, 99, 606].each do |number|
        expect(validation.validate(number)).to include(:divisible_by_three)
      end
    end

    it 'does not validate non-multiples of 3' do
      [-5, 5, 14, 28, 700].each do |number|
        expect(validation.validate(number)).not_to include(:divisible_by_three)
      end
    end

    it 'validates multiples of 5' do
      [-5, 0, 5, 10, 35, 120, 300, 605].each do |number|
        expect(validation.validate(number)).to include(:divisible_by_five)
      end
    end

    it 'does not validate non-multiples of 5' do
      [-7, -3, 12, 18, 909].each do |number|
        expect(validation.validate(number)).not_to include(:divisible_by_five)
      end
    end

    it 'validates multiples of 7' do
      [-7, 0, 7, 14, 98, 350, 357, 707].each do |number|
        expect(validation.validate(number)).to include(:divisible_by_seven)
      end
    end

    it 'does not validate non-multiples of 7' do
      [-5, -3, 12, 18, 909].each do |number|
        expect(validation.validate(number)).not_to include(:divisible_by_seven)
      end
    end

    it 'validates multiples of 9' do
      [-9, 0, 9, 99, 909, 9999].each do |number|
        expect(validation.validate(number)).to include(:divisible_by_nine)
      end
    end

    it 'does not validate non-multiples of 9' do
      [-7, 5, 33, 330, 700].each do |number|
        expect(validation.validate(number)).not_to include(:divisible_by_nine)
      end
    end
  end

  context 'with a non-integer' do
    it { expect { validation.validate('ab') }.to raise_error(InvalidNumberError) }
    it { expect { validation.validate(:symbol) }.to raise_error(InvalidNumberError) }
    it { expect { validation.validate(3.14159) }.to raise_error(InvalidNumberError) }
    it { expect { validation.validate(Class.new) }.to raise_error(InvalidNumberError) }
  end
end
