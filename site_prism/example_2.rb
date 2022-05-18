# frozen_string_literal: true

# Pre-requisite setup required for each test
require_relative 'setup'
require_relative 'pages/inputs'
Setup.setup

# Create and load the page
page = Inputs.new
page.load

# Find the number box on the page
number_box = page.number_box

# Type in some numbers
number_box.send_keys('123')

# Type in some more numbers
number_box.send_keys('456')

# Find out what 'value' property is for the number box
# Check the W3C Spec or W3Schools for what text box values represent
puts number_box['value']

# Wait and close
sleep 2
