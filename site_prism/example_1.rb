# frozen_string_literal: true

# Pre-requisite setup required for each test
require_relative 'setup'
require_relative 'pages/inputs'
Setup.setup

# Create and load the page
page = Inputs.new
page.load

# Find the title and then grab the text
title = page.title
puts title.text

# Wait and close
sleep 2
