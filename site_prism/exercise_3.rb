# frozen_string_literal: true

# Pre-requisite setup required for each test
require_relative 'setup'
require_relative 'pages/dropdown'
Setup.setup

# Create and load the page
page = Inputs.new
page.load

# EXERCISE 3
# We are going to simulate a user picking the last option from a dropdown menu

# 1) Find the original dropdown with its label

# 2) Click this and a bunch of new options should appear

# 3) Find all of the new dropdown options

# 4) Click on the last item from our list

# 5) Check we have done this correctly by finding out the label of the displayed option

# 6) Compare the visible label to the item on the list we stored from the dropdown options

# Wait and close
sleep 2

# THOUGHT(s)
# When something fails, read the error. Maybe we need to use a different name for one of our previous methods?
#
# When indexing items, and we want to read in reverse, how do we signify this?
#
# In computers, the = sign does not mean is equal to. How do we say are 2 things equal?
