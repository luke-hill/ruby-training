RSpec.describe 'objects in ruby' do
  it 'is fundamental - everything is an object' do
    expect(10.is_a?(Object)).to eq(true)
    expect(3.5.is_a?(Object)).to eq(true)
    expect('string'.is_a?(Object)).to eq(true)
    expect(nil.is_a?(Object)).to eq(true)
    expect(Object.is_a?(Object)).to eq(true)
  end

  it 'can be converted to a string' do
    expect(999.to_s).to eq('999')
    expect(nil.to_s).to eq('')
  end

  it 'can be inspected' do
    expect(123.inspect).to eq('123')
    expect(nil.inspect).to eq('nil')
  end

  it 'has an id' do
    obj = Object.new
    expect(obj.object_id.class).to eq(Integer)
  end

  it 'has a unique id' do
    obj = Object.new
    another_obj = Object.new
    expect(obj.object_id != another_obj.object_id).to eq(true)
  end

  it 'has a fixed id when it is a small integer' do
    expect(0.object_id).to eq(1)
    expect(1.object_id).to eq(3)
    expect(2.object_id).to eq(5)
    expect(100.object_id).to eq(201)
  end

  it 'can be cloned to create a new object' do
    obj = Object.new
    copy = obj.clone

    expect(obj != copy).to eq(true)
    expect(obj.object_id != copy.object_id).to eq(true)
  end
end

