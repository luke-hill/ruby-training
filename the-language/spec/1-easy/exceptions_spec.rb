# frozen_string_literal: true

RSpec.describe 'exceptions' do
  class MySpecialError < RuntimeError
  end

  it 'inherits from Exception' do
    expect(MySpecialError.ancestors[1]).to eq(RuntimeError)
    expect(MySpecialError.ancestors[2]).to eq(StandardError)
    expect(MySpecialError.ancestors[3]).to eq(Exception)
    expect(MySpecialError.ancestors[4]).to eq(Object)
  end

  it 'is possible to `rescue` an exception' do
    result = nil
    begin
      fail 'Oops'
    rescue StandardError => e
      result = :exception_handled
    end

    expect(result).to eq(:exception_handled)

    expect(e.is_a?(StandardError)).to eq(true), 'Should be a Standard Error'
    expect(e.is_a?(RuntimeError)).to eq(true),  'Should be a Runtime Error'

    expect(RuntimeError.ancestors.include?(StandardError))
      .to be(true), 'RuntimeError is a subclass of StandardError'

    expect(e.message).to eq('Oops')
  end

  it 'can raise a specific error' do
    result = nil
    begin
      # 'raise' and 'fail' are synonyms
      raise MySpecialError, 'My Message'
    rescue MySpecialError => e
      result = :exception_handled
    end

    expect(result).to eq(:exception_handled)
    expect(e.message).to eq('My Message')
  end

  it 'can `ensure` code is always run' do
    result = nil
    begin
      fail 'Oops'
    rescue StandardError
      # no code here
    ensure
      result = :always_run
    end

    expect(result).to eq(:always_run)
  end

  it 'can raise a new instance of an error' do
    # A do-end is a block, which we'll come back to
    expect do
      raise MySpecialError.new('New instances can be raised directly.')
    end.to raise_error('New instances can be raised directly.')
  end
end
