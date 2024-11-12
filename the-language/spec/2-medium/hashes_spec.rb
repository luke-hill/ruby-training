RSpec.describe 'Hashes' do
  it 'can be created like any other object' do
    empty_hash = Hash.new

    expect(empty_hash.class).to eq(__)
    expect(empty_hash.size).to eq(__)
  end

  it 'can be created using the hash literal syntax' do
    empty_hash = {}
    expect(empty_hash).to eq(__)

    hash = { one: 1, two: 2 }
    expect(hash.length).to eq(__)
  end

  it 'has a subscript syntax for accessing elements' do
    hash = { one: 1, two: 2 }

    expect(hash[:one]).to eq(__)
    expect(hash[:two]).to eq(__)
    expect(hash[:three]).to eq(__)
  end

  it 'has a fetch method for accessing elements' do
    hash = { one: 1, two: 2 }

    expect(hash.fetch(:one)).to eq(__)
    expect(hash.fetch(:two)).to eq(__)
    expect { hash.fetch(:three) }.to raise_error(__)
  end

  it 'has a fallback method for fetch' do
    hash = { one: 1, two: 2 }

    expect(hash.fetch(:three, 3)).to eq(__)
    expect(hash.fetch(:three) { 3 }).to eq(__)

    # THINK: Why are there two ways for expressing this fallback behaviour? Have a google
    # on this topic and note down your findings
  end

  it 'allows you to change the value at a specific location' do
    hash = { one: 1, two: 2 }
    hash[:one] = 'ONE'

    expect(hash).to eq(__)
  end

  it 'is unordered' do
    hash1 = { one: 1, two: 2 }
    hash2 = { two: 2, one: 1 }

    expect(hash1 == hash2).to eq(__)
  end

  it 'has a list of its keys' do
    hash = { one: 1, two: 2 }

    expect(hash.keys.size).to eq(__)
    expect(hash.keys.include?(:one)).to eq(__)
    expect(hash.keys.include?(:two)).to eq(__)
    expect(hash.keys.include?(:three)).to eq(__)
    expect(hash.keys.class).to eq(__)
  end

  it 'hashes can be merged' do
    hash = { apples: 4, bananas: 8, grapes: 48 }
    new_hash = hash.merge({ bananas: 9, oranges: 3 })

    expect(hash != new_hash).to eq(__)
    expect(new_hash).to eq(__)
  end

  it 'can have a default value' do
    hash = {}
    hash[:one] = 1

    expect(hash[:one]).to eq(__)
    expect(hash[:two]).to eq(__)

    hash_with_default = Hash.new(2)
    hash_with_default[:one] = 1

    expect(hash_with_default[:one]).to eq(__)
    expect(hash_with_default[:two]).to eq(__)
    expect(hash_with_default[:three]).to eq(__)
  end

  it 'always returns the same object as the default value' do
    hash = Hash.new([])

    hash[:a] << 'A'
    hash[:b] << 'B'

    expect(hash[:a]).to eq(__)
    expect(hash[:b]).to eq(__)
    expect(hash[:c]).to eq(__)

    expect(hash[:a].object_id == hash[:b].object_id).to eq(__)
  end

  it 'can set a default value using a block' do
    hash = Hash.new { |this_hash, key| this_hash[key] = [] }

    hash[:one] << 1
    hash[:two] << 2

    expect(hash[:one]).to eq(__)
    expect(hash[:two]).to eq(__)
    expect(hash[:three]).to eq(__)
  end
end
