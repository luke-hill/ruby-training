RSpec.describe 'objects in ruby' do
  it 'is fundamental - everything is an object' do
    expect(10.is_a?(Object)).to eq(__)
    expect(3.5.is_a?(Object)).to eq(__)
    expect('string'.is_a?(Object)).to eq(__)
    expect(nil.is_a?(Object)).to eq(__)
    expect(Object.is_a?(Object)).to eq(__)
  end

  it 'can be converted to a string' do
    expect(999.to_s).to eq(__)
    expect(nil.to_s).to eq(__)
  end

  it 'can be inspected' do
    expect(123.inspect).to eq(__)
    expect(nil.inspect).to eq(__)
  end

  it 'has an id' do
    obj = Object.new
    expect(obj.object_id.class).to eq(__)
  end

  it 'has a unique id' do
    obj = Object.new
    another_obj = Object.new
    expect(obj.object_id != another_obj.object_id).to eq(__)
  end

  it 'has a fixed id when it is a small integer' do
    expect(0.object_id).to eq(__)
    expect(1.object_id).to eq(__)
    expect(2.object_id).to eq(__)
    expect(100.object_id).to eq(__)
  end

  it 'can be cloned to create a new object' do
    obj = Object.new
    copy = obj.clone

    expect(obj != copy).to eq(__)
    expect(obj.object_id != copy.object_id).to eq(__)
  end
end

