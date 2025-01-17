RSpec.describe 'Regular expressions' do
  it 'is a type of regexp' do
    expect(/pattern/.class).to eq(Regexp)
  end

  it 'can fetch the first instance of a pattern that is found in a string' do
    expect('a string that matches'[/match/]).to eq("match")
  end

  it 'returns nil when the match fails' do
    expect('a string that matches'[/fails/]).to eq(nil)
  end

  it 'uses a ? on its own to signify "optional" (0 or 1 of the preceding item)' do
    expect('abcd'[/ab?/]).to eq("ab")
    expect('abcd'[/ae?/]).to eq("a")
  end

  it 'uses + to mean one or more (of the preceding group)' do
    expect('abcccd'[/ac+/]).to eq(nil)
    expect('abcccd'[/bc+/]).to eq("bccc")
  end

  it 'uses * to mean zero or more (of the preceding group)' do
    expect('abbcccdddd'[/ab*/]).to eq("abb")
    expect('abbcccdddd'[/az*/]).to eq("a")
    expect('abbcccdddd'[/z*/]).to eq("")
  end

  it 'matches from the left first' do
    expect('acdz az'[/az*/]).to eq("a")
  end

  it 'can use character classes to provide options' do
    words = ['cat', 'sat', 'mat']
    expect(words.select { |word| word[/[cm]at/] }).to eq(["cat", "mat"])
  end

  it 'uses \d as a shortcut for a digit character class' do
    expect('3 is the magic number'[/[0123456789]/]).to eq("3")
    expect('3 is the magic number'[/\d/]).to eq("3")
  end

  it 'allows ranges in character classes' do
    expect('3 is the magic number'[/[0-9]/]).to eq("3")
  end

  it 'uses \s as the shortcut for white space' do
    expect("space: \t\n"[/\s+/]).to eq(" \t\n")
  end

  it 'uses \w as the shortcut for word characters' do
    expect('magic_number_1 = 3'[/[a-zA-Z0-9_]+/]).to eq("magic_number_1")
    expect('magic_number_1 = 3'[/\w+/]).to eq("magic_number_1")
  end

  it 'uses . as a shortcut for any character, except a new line' do
    expect("abc\n123"[/a.+/]).to eq("abc")
  end

  it 'can negate a character class' do
    expect('3 is the magic number'[/[^0-9]+/]).to eq(" is the magic number")
  end

  it 'uses capitals to negate shortcut characters' do
    # Capitals are less commonly used as they're not as comprehensible
    expect('3 is the magic number'[/\D+/]).to eq(" is the magic number")
    expect("space: \t\n"[/\S+/]).to eq("space:")
    # ... a programmer would most likely do
    expect('magic_number_1 = 3'[/[^a-zA-Z0-9_]+/]).to eq(" = ")
    expect('magic_number_1 = 42'[/\W+/]).to eq(" = ")
  end

  it 'uses \A to mark the start of the string' do
    expect('start end'[/\Astart/]).to eq(__)
    expect('start end'[/\Aend/]).to eq(__)
  end

  it 'uses \z to mark the end of the string' do
    expect('start end'[/end\z/]).to eq(__)
    expect('start end'[/start\z/]).to eq(__)
  end

  it 'uses ^ to mark the start of lines' do
    expect("magic number 8\n3 magic number"[/^\d+/]).to eq(__)
  end

  it 'uses $ to mark the end of lines' do
    expect("8 magic number\nmagic number 3"[/\d+$/]).to eq(__)
  end

  it 'uses \b to anchor word boundaries' do
    expect('wildcat cats'[/\bcat.+/]).to eq(__)
  end

  it 'uses parentheses to group content' do
    expect('yohoho'[/(ho)+/]).to eq(__)
  end

  it 'also uses parentheses to capture content' do
    expect('Gary, James'[/(\w+), (\w+)/, 1]).to eq(__)
    expect('Gary, James'[/(\w+), (\w+)/, 2]).to eq(__)
  end

  it 'has special variables to access captures' do
    expect('Name: Gary, James'[/(\w+), (\w+)/]).to eq(__)
    expect($1).to eq(__)
    expect($2).to eq(__)
  end

  it 'uses a | to offer alternatives for a group' do
    simpsons = /(Bart|Lisa|Maggie) Simpson/

    expect('Bart Simpson'[simpsons]).to eq(__)
    expect('Maggie Simpson'[simpsons]).to eq(__)
    expect('Homer Simpson'[simpsons]).to eq(__)
  end

  it 'uses scan to find all instances that match a specific regex' do
    expect('one two-three'.scan(/\w+/)).to eq(__)
  end

  it 'can use #sub to find and replace (a single instance), using regex' do
    expect('one two-three'.sub(/(t\w*)/) { $1[0, 1] }).to eq(__)
  end

  it 'can use #gsub to find and replace (all instances), using regex' do
    expect('one two-three'.gsub(/(t\w*)/) { $1[0, 1] }).to eq(__)
  end
end
