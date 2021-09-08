# frozen_string_literal: true

require_relative 'setup'
require_relative 'pages/inputs'
Setup.new

# Create and load the page
page = Inputs.new
page.load

# Find the number box on the page
number_box = page.number_box

# Type in some numbers
number_box.send_keys('123')
sleep 2

# Type in some more numbers
number_box.send_keys('456')
sleep 2

# Find out what value is in the number box
puts number_box['value']
sleep 2
