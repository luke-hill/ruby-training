# frozen_string_literal: true

require_relative 'setup'
require_relative 'pages/inputs'
Setup.new

# Create and load the page
page = Inputs.new
page.load

# Find the title and then grab the text
title = page.title
puts title.text

# Wait and close
sleep 2
