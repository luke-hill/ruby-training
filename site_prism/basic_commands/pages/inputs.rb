# frozen_string_literal: true

class Inputs < SitePrism::Page
  set_url '/inputs'

  element :title, 'h3'
  element :number_box, '[type="number"]'
end
