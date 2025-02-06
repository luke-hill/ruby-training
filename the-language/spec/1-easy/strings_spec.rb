RSpec.describe 'Strings' do
  it 'can be created with double quotes' do
    string = "Hello, world!"
    expect(string.is_a?(String)).to eq(__)
  end

  it 'can be created with single quotes' do
    string = 'Hello, you!'
    expect(string.is_a?(String)).to eq(__)
  end

  it 'can create a string with single quotes that contains double quotes within it' do
    string = '"What a curious feeling!" said Alice.'
    expect(string).to eq(__)
  end

  it 'can create a string with double quotes that contains single quotes within it' do
    string = "Isn't that useful?"
    expect(string).to eq(__)
  end

  it "can use backslashes to escape the cases that don't fit" do
    double = "Jane said \"Don't\""
    single = 'Jane said "Don\'t"'

    expect(double == single).to eq(__)
  end

  it 'has flexible quoting when things get difficult' do
    # NB: These are not commonly used!!
    a = %(flexible quotes allow both " and ' characters)
    b = %!flexible quotes allow both " and ' characters!
    c = %{flexible quotes allow both " and ' characters}

    expect(a == b).to eq(__)
    expect(a == c).to eq(__)
  end

  it 'can handle multiple lines with flexible quoting' do
    string = %{
Humpty dumpty sat on the wall,
Humpty dumpty had a great fall
}

    expect(string.length).to eq(__)
    expect(string.lines.count).to eq(__)
    expect(string[0, 1]).to eq(__)
  end

  it 'can also handle multiple lines with a heredoc' do
    string = <<~STRING
      Humpty dumpty sat on the wall,
      Humpty dumpty had a great fall
    STRING

    expect(string.length).to eq(__)
    expect(string.lines.count).to eq(__)
    expect(string[0, 1]).to eq(__)
  end

  it 'can also be written on multiple lines by "continuing" the string' do
    string = "Humpty dumpty sat on the wall,"\
             "Humpty dumpty had a great fall"

    expect(string.length).to eq(__)
    expect(string.lines.count).to eq(__)
    expect(string[0, 1]).to eq(__)
  end

  it 'can be concatenated with +' do
    string = 'Hello, ' + 'World!'
    expect(string).to eq(__)
  end

  it 'does not modify the original string when using +' do
    prefix = 'Hello, '
    suffix  = 'World!'
    greeting = prefix + suffix

    expect(greeting).to eq(__)
    expect(prefix).to eq(__)
    expect(suffix).to eq(__)
  end

  it 'will concatenate on the end of a string using +=' do
    original_greeting = 'Hello, '
    greeting = original_greeting
    subject  = 'World!'

    # NB: This mutates the original string, and is something frowned upon in normal ruby
    greeting += subject

    expect(original_greeting).to eq(__)
    expect(greeting).to eq(__)
  end

  it 'will interpret escape characters with double quotes' do
    string = "\n"
    expect(string.size).to eq(__)
  end

  it "won't interpret escape characters with single quotes" do
    string = '\n'
    expect(string.size).to eq(__)
  end

  it 'can interpret some escape characters with single quotes' do
    string = '\\\\'
    expect(string.size).to eq(__)
  end

  it 'can interpolate variable using double quotes' do
    count = 99
    string = "#{count} bottles of beer on the wall."

    expect(string).to eq(__)
  end

  it "won't interpolate variable using single quotes" do
    count = 99
    string = '#{count} bottles of beer on the wall.'

    expect(string).to eq(__)
  end

  it 'will interpolate any ruby expression' do
    count = 99
    string = "#{(count - 1) / 2} bottles of beer on the wall."

    expect(string).to eq(__)
  end

  it 'uses `#[]` and a single argument to extract a single character as a substring' do
    string = 'Bacon, lettuce and tomato'
    # NB: When using the `[]` method. The argument goes "inside" the `[]` instead of `[](argument)
    # This is a unique idiom to the `#[]` method and doesn't happen elsewhere with method arguments
    expect(string[7]).to eq(__)
  end

  it 'can use `#[]` with two arguments to extract a substring' do
    string = 'Bacon, lettuce and tomato'

    expect(string[7, 3]).to eq(__)
  end

  it 'can use `#[]` with a range to extract a substring' do
    string = 'Bacon, lettuce and tomato'

    expect(string[7..9]).to eq(__)
  end

  it 'can split a string into individual characters' do
    string = 'Bacon, lettuce and tomato'

    expect(string.chars).to eq(__)
  end

  it 'represents single characters as strings' do
    # This single char representation isn't used in practice
    expect(?a).to eq(__)
    expect(?a == 97).to eq(__)
  end

  it 'can split a string' do
    string = 'Strings Are Fun'
    words = string.split

    expect(words).to eq(__)
  end

  it 'can split a string on a different character' do
    string = 'has:many:through'
    words = string.split(':')

    expect(words).to eq(__)
  end

  it 'can join strings' do
    words = ['Welcome', 'to', 'the', 'joinery']
    string = words.join(' ')

    expect(string).to eq(__)
  end

  it 'is a unique object' do
    a = 'Hello, world!'
    b = 'Hello, world!'

    expect(a == b).to eq(__)
    puts a.object_id
    puts b.object_id

    # What does the above 2 commands show you in the console?
    # Why do you think this is the case, have a quick think / google
    expect(a.object_id == b.object_id).to eq(__)
  end
end
