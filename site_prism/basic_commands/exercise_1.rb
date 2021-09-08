# frozen_string_literal: true

require_relative 'setup'
require_relative 'pages/inputs'
Setup.new
using Rainbow

page = Inputs.new
page.load
title = page.title.text
puts title.yellow.bright.underline
sleep 2
