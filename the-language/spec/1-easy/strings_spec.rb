# frozen_string_literal: true

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

  it 'can use backslashes to escape the cases that do not fit' do
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
    string = 'Humpty dumpty sat on the wall,'\
             'Humpty dumpty had a great fall'

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

  it 'can concatenate on the end of a string using +=' do
    # NB: This is a deprecated Koan.
    #
    # We will remove this as we don't want to advertise this as it is something frowned on in normal Ruby.
    # You can use this method, but ideally we should always be creating new strings or methods and
    # having the GC collect up all unwanted items
    original_greeting = 'Hello, '
    greeting = original_greeting
    subject  = 'World!'

    # NB: This mutates the original string, and is something frowned upon in normal ruby
    greeting += subject

    expect(original_greeting).to eq(__)
    expect(greeting).to eq(__)
  end

  it 'can interpret escape characters when using double quotes' do
    string = "\n"
    expect(string.size).to eq(__)
  end

  it 'cannot interpret escape characters when using single quotes' do
    string = '\n'
    expect(string.size).to eq(__)
  end

  it 'can interpret some escape characters with single quotes' do
    string = '\\\\'
    expect(string.size).to eq(__)
  end

  it 'can interpolate variables when using double quotes' do
    count = 99
    string = "#{count} bottles of beer on the wall."

    expect(string).to eq(__)
  end

  it 'cannot interpolate variables when using single quotes' do
    count = 99
    string = '#{count} bottles of beer on the wall.'

    expect(string).to eq(__)
  end

  it 'can interpolate any ruby expression' do
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
    # NB: This is a "changing" Koan. It will change in output from when we start using frozen string literals
    #
    # In the world of computers, having things constantly be new objects takes up more memory in the heap
    #
    # Ideally we wouldn't want excess objects where we don't need them. So when we stipulate that all strings
    # are to be frozen, we know they will be immutable, so their place in memory can now be reserved and determinate
    #
    # As such all frozen strings from Ruby 3.0 will take up the same object-space, and act akin to a symbol
    # which will improve the programs memory footprint but also change the way this Koan is answered
    a = 'Hello, world!'
    b = 'Hello, world!'

    expect(a == b).to eq(__)
    puts a.object_id
    puts b.object_id

    # What does the above 2 commands show you in the console?

    # These object ids weren't always the same. What would make them the same / different?
    expect(a.object_id == b.object_id).to eq(__)
  end
end
