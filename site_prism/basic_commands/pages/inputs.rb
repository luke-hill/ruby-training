# frozen_string_literal: true

class Inputs < SitePrism::Page
  set_url '/inputs'

  element :title, 'h3'
  element :dropdown_list, '#dropdown'
  elements :dropdown_options, '#dropdown option'
end
