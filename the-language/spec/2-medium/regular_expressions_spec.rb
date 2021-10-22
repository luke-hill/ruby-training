RSpec.describe 'regular expressions' do
  it 'is a pattern' do
    expect(/pattern/.class).to eq(__)
  end

  it 'can search a string for content that matches the pattern' do
    expect('a string that matches'[/match/]).to eq(__)
  end

  it 'returns nil when the match fails' do
    expect('a string that matches'[/fails/]).to eq(__)
  end

  it 'uses a ? for optional' do
    expect('abcd'[/ab?/]).to eq(__)
    expect('abcd'[/ae?/]).to eq(__)
  end

  it 'uses + to mean one or more' do
    expect('abcccd'[/bc+/]).to eq(__)
  end

  it 'uses * to mean zero or more' do
    expect('abbcccdddd'[/ab*/]).to eq(__)
    expect('abbcccdddd'[/az*/]).to eq(__)
    expect('abbcccdddd'[/z*/]).to eq(__)
  end

  it 'matches from the left first' do
    expect('acdz az'[/az*/]).to eq(__)
  end

  it 'can use character classes to provide options' do
    words = ['cat', 'sat', 'mat']
    expect(words.select { |w| w[/[cm]at/] }).to eq(__)
  end

  it "uses \d as a shortcut for a digit character class" do
    expect('3 is the magic number'[/[0123456789]/]).to eq(__)
    expect('3 is the magic number'[/\d/]).to eq(__)
  end

  it 'allows ranges in character classes' do
    expect('3 is the magic number'[/[0-9]/]).to eq(__)
  end

  it 'uses \s as the shortcut for white space' do
    expect("space: \t\n"[/\s+/]).to eq(__)
  end

  it 'uses \w as the shortcut for word characters' do
    expect('magic_number_1 = 3'[/[a-zA-Z0-9_]+/]).to eq(__)
    expect('magic_number_1 = 3'[/\w+/]).to eq(__)
  end

  it 'uses . as a shortcut for any character, except a new line' do
    expect("abc\n123"[/a.+/]).to eq(__)
  end

  it 'can negate a character class' do
    expect('3 is the magic number'[/[^0-9]+/]).to eq(__)
  end

  it 'uses capitals to negate shortcut characters' do
    expect('3 is the magic number'[/\D+/]).to eq(__)
    expect("space: \t\n"[/\S+/]).to eq(__)
    # ... a programmer would most likely do
    expect('magic_number_1 = 3'[/[^a-zA-Z0-9_]+/]).to eq(__)
    expect('magic_number_1 = 42'[/\W+/]).to eq(__)
  end

  it "uses \A to mark the start of the string" do
    expect('start end'[/\Astart/]).to eq(__)
    expect('start end'[/\Aend/]).to eq(__)
  end

  it "uses \z to mark the end of the string" do
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

  it 'uses parens to group content' do
    expect('yohoho'[/(ho)+/]).to eq(__)
  end

  it 'also uses parens to capture content' do
    expect('Gray, James'[/(\w+), (\w+)/, 1]).to eq(__)
    expect('Gray, James'[/(\w+), (\w+)/, 2]).to eq(__)
  end

  it 'has special variables to access captures' do
    expect('Name: Gray, James'[/(\w+), (\w+)/]).to eq(__)
    expect($1).to eq(__)
    expect($2).to eq(__)
  end

  it 'uses a | to show alternatives' do
    simpsons = /(Bart|Lisa|Maggie) Simpson/

    expect('Bart Simpson'[simpsons]).to eq(__)
    expect('Maggie Simpson'[simpsons]).to eq(__)
    expect('Montgomery Simpson'[simpsons]).to eq(__)
  end

  it 'uses scan to find all' do
    expect('one two-three'.scan(/\w+/)).to eq(__)
  end

  it 'uses sub to find and replace' do
    expect('one two-three'.sub(/(t\w*)/) { $1[0, 1] }).to eq(__)
  end

  it 'uses gsub to find and replace all' do
    expect('one two-three'.gsub(/(t\w*)/) { $1[0, 1] }).to eq(__)
  end
end
