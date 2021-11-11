RSpec.describe 'regular expressions' do
  it 'is a type of regexp' do
    expect(/pattern/.class).to eq(Regexp)
  end

  it 'can fetch the first instance of a pattern that is found in a string' do
    expect('a string that matches'[/match/]).to eq('match')
  end

  it 'returns nil when the match fails' do
    expect('a string that matches'[/fails/]).to eq(nil)
  end

  it 'uses a ? for optional (0 or 1 of the preceding item)' do
    expect('abcd'[/ab?/]).to eq('ab')
    expect('abcd'[/ae?/]).to eq('a')
  end

  it 'uses + to mean one or more' do
    expect('abcccd'[/ac+/]).to eq(nil)
    expect('abcccd'[/bc+/]).to eq('bccc')
  end

  it 'uses * to mean zero or more' do
    expect('abbcccdddd'[/ab*/]).to eq('abb')
    expect('abbcccdddd'[/az*/]).to eq('a')
    expect('abbcccdddd'[/z*/]).to eq("")
  end

  it 'matches from the left first' do
    expect('acdz az'[/az*/]).to eq('a')
  end

  it 'can use character classes to provide options' do
    words = ['cat', 'sat', 'mat']
    expect(words.select { |word| word[/[cm]at/] }).to eq(['cat', 'mat'])
  end

  it 'uses \d as a shortcut for a digit character class' do
    expect('3 is the magic number'[/[0123456789]/]).to eq('3')
    expect('3 is the magic number'[/\d/]).to eq('3')
  end

  it 'allows ranges in character classes' do
    expect('3 is the magic number'[/[0-9]/]).to eq('3')
  end

  it 'uses \s as the shortcut for white space' do
    expect("space: \t\n"[/\s+/]).to eq(" \t\n")
  end

  it 'uses \w as the shortcut for word characters' do
    expect('magic_number_1 = 3'[/[a-zA-Z0-9_]+/]).to eq('magic_number_1')
    expect('magic_number_1 = 3'[/\w+/]).to eq('magic_number_1')
  end

  it 'uses . as a shortcut for any character, except a new line' do
    expect("acb\n123"[/a.+/]).to eq('acb')
  end

  it 'can negate a character class' do
    expect('3 is the magic number'[/[^0-9]+/]).to eq(' is the magic number')
  end

  it 'uses capitals to negate shortcut characters' do
    expect('3 is the magic number'[/\D+/]).to eq(' is the magic number')
    expect("space: \t\n"[/\S+/]).to eq('space:')
    # ... a programmer would most likely do
    expect('magic_number_1 = 3'[/[^a-zA-Z0-9_]+/]).to eq(' = ')
    expect('magic_number_1 = 42'[/\W+/]).to eq(' = ')
  end

  it 'uses \A to mark the start of the string' do
    expect('start end'[/\Astart/]).to eq('start')
    expect('start end'[/\Aend/]).to eq(nil)
  end

  it 'uses \z to mark the end of the string' do
    expect('start end'[/end\z/]).to eq('end')
    expect('start end'[/start\z/]).to eq(nil)
  end

  it 'uses ^ to mark the start of lines' do
    expect("magic number 8\n3 magic number"[/^\d+/]).to eq('3')
  end

  it 'uses $ to mark the end of lines' do
    expect("8 magic number\nmagic number 3"[/\d+$/]).to eq('3')
  end

  it 'uses \b to anchor word boundaries' do
    expect('wildcat cats'[/\bcat.+/]).to eq('cats')
  end

  it 'uses parentheses to group content' do
    expect('yohoho'[/(ho)+/]).to eq('hoho')
  end

  it 'also uses parentheses to capture content' do
    expect('Gray, James'[/(\w+), (\w+)/, 1]).to eq('Gray')
    expect('Gray, James'[/(\w+), (\w+)/, 2]).to eq('James')
  end

  it 'has special variables to access captures' do
    expect('Name: Gray, James'[/(\w+), (\w+)/]).to eq('Gray, James')
    expect($1).to eq('Gray')
    expect($2).to eq('James')
  end

  it 'uses a | to offer alternatives for a group' do
    simpsons = /(Bart|Lisa|Maggie) Simpson/

    expect('Bart Simpson'[simpsons]).to eq('Bart Simpson')
    expect('Maggie Simpson'[simpsons]).to eq('Maggie Simpson')
    expect('Montgomery Simpson'[simpsons]).to eq(nil)
  end

  it 'uses scan to find all instances that match a specific regex' do
    expect('one two-three'.scan(/\w+/)).to eq(['one', 'two', 'three'])
  end

  it 'can use #sub to find and replace using regex' do
    expect('one two-three'.sub(/(t\w*)/) { $1[0, 1] }).to eq('one t-three')
  end

  it 'can use #gsub to find and replace all instances of something using regex' do
    expect('one two-three'.gsub(/(t\w*)/) { $1[0, 1] }).to eq('one t-t')
  end
end
