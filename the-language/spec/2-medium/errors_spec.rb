RSpec.describe 'Errors and Exceptions' do
  class MySpecialError < RuntimeError
  end

  it 'Errors inherit from Exception' do
    expect(MySpecialError.ancestors[1]).to eq(RuntimeError)
    expect(MySpecialError.ancestors[2]).to eq(StandardError)
    expect(MySpecialError.ancestors[3]).to eq(Exception)
    expect(MySpecialError.ancestors[4]).to eq(Object)
  end

  it 'is possible to `rescue` an error' do
    result = nil
    begin
      fail 'Oops'
    rescue StandardError => e
      result = :exception_handled
    end

    expect(result).to eq(:exception_handled)

    expect(e.is_a?(StandardError)).to eq([2]), 'Should be a Standard Error'
    expect(e.is_a?(RuntimeError)).to eq([1]),  'Should be a Runtime Error'

    # Think why the answer to this test is what it is?
    expect(RuntimeError.ancestors.include?()).to eq([])

    expect(e.message).to eq()
  end

  it 'can raise a specific error' do
    result = nil
    begin
      # 'raise' and 'fail' are synonyms - but raise is used more often
      raise MySpecialError, 'My Message'
    rescue MySpecialError => e
      result = :exception_handled
    end

    expect(result).to eq(__)
    expect(e.message).to eq(__)
  end

  it 'can `ensure` code is always run' do
    result = nil
    begin
      raise 'Oops'
    rescue StandardError
      # no code here
    ensure
      result = :always_run
    end

    expect(result).to eq(__)
  end

  it 'can raise a new instance of an error' do
    # A do-end is a block, which we'll come back to
    expect do
      raise MySpecialError.new('New instances can be raised directly.')
    end.to raise_error(__)
  end

  it 'can also throw errors if we try editing things we are not meant to' do
    cold_string = 'ice cube'.freeze
    hot_string = 'hot water bottle'

    expect { cold_string << hot_string }.to raise_error(__)

    # What would you expect if you did the above operation the other way around
    # Are there other ways to perform a similar action?

    cold_array = [1, 2].freeze
    hot_array = [100, 200]

    expect { cold_array.push(hot_array) }.to raise_error(__)
  end
end
