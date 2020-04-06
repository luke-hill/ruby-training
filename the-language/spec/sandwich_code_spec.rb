RSpec.describe "sandwich code" do

  # This is a common pattern you will see in ruby for finding files
  # relative to the current path. Look up whats happening in the docs if
  # you wan to know more.
  #
  # Here we are setting EXAMPLE_FILE to the path of a file called
  # "example_file.txt" in the same directory as this file.
  EXAMPLE_FILE = File.join(File.dirname(__FILE__), "example_file.txt")

  def count_lines(file_name)
    file = open(file_name)
    count = 0
    while file.gets
      count += 1
    end
    count
  ensure
    file.close if file
  end

  it "can count lines in file" do
    expect( count_lines(EXAMPLE_FILE) ).to eq( __ )
  end

  def find_line(file_name)
    file = open(file_name)
    while line = file.gets
      return line if line.match(/e/)
    end
  ensure
    file.close if file
  end

  it "can find a line" do
    expect( find_line(EXAMPLE_FILE) ).to eq( __ )
  end

  # What do you notice about `find_line` and `count_lines`?
  #
  # How are they similar?
  #
  # They both follow a similar pattern - but the difference is in the
  # middle - like a sandwich.
  #
  # The top part and the bottom part are the same - the bread... but the
  # middle - the filling changes.
  #
  # Pulling out the top and bottom parts into a library is difficult in
  # many languages.
  #
  # Consider the following code:

  def file_sandwich(file_name)
    file = open(file_name)
    yield(file)
  ensure
    file.close if file
  end

  # Now we write:

  def count_lines2(file_name)
    file_sandwich(file_name) do |file|
      count = 0
      while file.gets
        count += 1
      end
      count
    end
  end

  it "can count lines in file again" do
    expect( count_lines2(EXAMPLE_FILE) ).to eq( __ )
  end

  def find_line2(file_name)
    # Rewrite find_line using the file_sandwich library function.
  end

  it "can count lines in file, again" do
    expect( find_line2(EXAMPLE_FILE) ).to eq( __ )
  end

  def count_lines3(file_name)
    open(file_name) do |file|
      count = 0
      while file.gets
        count += 1
      end
      count
    end
  end

  it "supports the sandwich by passing a block to open" do
    expect( count_lines3("example_file.txt") ).to eq( __ )
  end

end
