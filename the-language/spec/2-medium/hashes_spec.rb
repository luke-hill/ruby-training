RSpec.describe 'hashes' do
  it 'can be created like any other object' do
    empty_hash = Hash.new

    expect(empty_hash.class).to eq(Hash)
    expect(empty_hash.size).to eq(0)
  end

  it 'can be created using the hash literal syntax' do
    empty_hash = {}
    expect(empty_hash).to eq({})

    hash = { one: 1, two: 2 }
    expect(hash.length).to eq(2)
  end

  it 'has a subscript syntax for accessing elements' do
    hash = { one: 1, two: 2 }

    expect(hash[:one]).to eq(1)
    expect(hash[:two]).to eq(2)
    expect(hash[:three]).to eq(nil)
  end

  it 'has a fetch method for accessing elements' do
    hash = { one: 1, two: 2 }

    expect(hash.fetch(:one)).to eq(1)
    expect(hash.fetch(:two)).to eq(2)
    expect { hash.fetch(:three) }.to raise_error(KeyError)
  end

  it 'allows you to change the value at a specific location' do
    hash = { one: 1, two: 2 }
    hash[:one] = 'ONE'

    expect(hash).to eq({ one: 'ONE', two: 2 })
  end

  it 'is unordered' do
    hash1 = { one: 1, two: 2 }
    hash2 = { two: 2, one: 1 }

    expect(hash1 == hash2).to eq(true)
  end

  it 'has a list of its keys' do
    hash = { one: 1, two: 2 }

    expect(hash.keys.size).to eq(2)
    expect(hash.keys.include?(:one)).to eq(true)
    expect(hash.keys.include?(:two)).to eq(true)
    expect(hash.keys.include?(:three)).to eq(false)
    expect(hash.keys.class).to eq(Array)
  end

  it 'hashes can be merged' do
    hash = { apples: 4, bananas: 8, grapes: 48 }
    new_hash = hash.merge({ bananas: 9, oranges: 3 })

    expect(hash != new_hash).to eq(true)
    expect(new_hash).to eq({apples: 4, bananas: 9, grapes: 48, oranges: 3})
  end

  it 'can have a default value' do
    hash = {}
    hash[:one] = 1

    expect(hash[:one]).to eq(1)
    expect(hash[:two]).to eq(nil)

    hash_with_default = Hash.new(2)
    hash_with_default[:one] = 1

    expect(hash_with_default[:one]).to eq(1)
    expect(hash_with_default[:two]).to eq(2)
    expect(hash_with_default[:three]).to eq(2)
  end

  it 'always returns the same object as the default value' do
    hash = Hash.new([])

    hash[:a] << 'A'
    hash[:b] << 'B'

    expect(hash[:a]).to eq(["A", "B"])
    expect(hash[:b]).to eq(["A", "B"])
    expect(hash[:c]).to eq(["A", "B"])

    expect(hash[:a].object_id == hash[:b].object_id).to eq(true)
  end

  it 'can set a default value using a block' do
    hash = Hash.new { |this_hash, key| this_hash[key] = [] }

    hash[:one] << 1
    hash[:two] << 2

    expect(hash[:one]).to eq([1])
    expect(hash[:two]).to eq([2])
    expect(hash[:three]).to eq([])
  end
end
