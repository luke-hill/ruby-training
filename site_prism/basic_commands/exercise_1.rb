# frozen_string_literal: true

require_relative 'setup'
require_relative 'pages/inputs'
Setup.new
using Rainbow

page = Inputs.new
page.load
puts page.title.text.yellow.bright.underline
sleep 1
