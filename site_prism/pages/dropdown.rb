# frozen_string_literal: true

class Dropdown < SitePrism::Page
  # This DSL statement will procedurally set a variable that represents the stub that
  # attaches to the base url (Set earlier on), for this page object
  #
  # It will be used only when the `#load` method is called, or similarly named boolean checks
  # such as `#when_loaded` or `#loaded?`
  set_url '/dropdown'

  # Here we define our DSL items. the keyword method invocation at the start classifies the
  # DSL item, and then subsequent parameters define its name / locator e.t.c.
  #
  # Where the keyword is `element` we define a "single" item.
  # Where the keyword is `elements` we define a "collection" of items
  element :heading, 'h3'
  element :dropdown_list, '#dropdown'
  elements :dropdown_options, '#dropdown option'
end
