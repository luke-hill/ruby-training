# frozen_string_literal: true

class Dropdown < SitePrism::Page
  set_url 'https://the-internet.herokuapp.com/dropdown'

  element :title, 'h3'
  element :dropdown_list, '#dropdown'
  elements :dropdown_options, '#dropdown option'
end
