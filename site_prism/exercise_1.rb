# frozen_string_literal: true

# Pre-requisite setup required for each test
require_relative 'setup'
require_relative 'pages/inputs'
Setup.new

# Create and load the page
page = Inputs.new
page.load

# EXERCISE 1
# Type a number, then by interacting with the page, work out how the number
# changes and replace the number with a new one
#
# HINT
#
# To type the up/backspace key on a keyboard, you must use the symbol reference to
# the keys which is the name of the key preceded by a colon

# 1) Find the number box on the page

# 2) Type in any odd 5 digit number i.e. 12345

# 3) Using the up arrow, increase the number by 5

# 4) Find out the new number that is in the box

# 5) Delete the number and replace it with a number that is exactly half of that

# Wait and close
sleep 2
