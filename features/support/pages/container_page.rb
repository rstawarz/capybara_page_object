class Container
  include CapybaraPageObject::PageObject

  link(:section_link, css: 'a')
  button(:section_button, css: 'button')
  text_field(:section_text_field, css: '???')
  hidden_field(:section_hidden_field, css: '???')
  text_area(:section_text_area, css: '???')
  select_list(:section_select_list, css: '???')
  checkbox(:section_checkbox, css: '???')
  radio_button(:section_radio_button, css: '???')
  div(:section_div, css: '???')
  span(:section_span, css: '???')
  table(:section_table, css: '???')
  cell(:section_cell, css: '???') { |page| page.section_table_element.cell_element(:index => 1) }
  image(:section_image, css: '???')
  form(:section_form, css: '???')
  ordered_list(:section_ordered_list, css: '???')
  unordered_list(:section_unordered_list, css: '???')
  list_item(:section_list_item, css: '???') { |page| page.section_ordered_list_element.list_item_element }
  h1(:section_h1, css: '???')
  h2(:section_h2, css: '???')
  h3(:section_h3, css: '???')
  h4(:section_h4, css: '???')
  h5(:section_h5, css: '???')
  h6(:section_h6, css: '???')
  paragraph(:section_paragraph, css: '???')
  file_field(:section_file_field, css: '???')

  #indexed_property(:indexed_list,[[:link,:indexed_link,href: '%s.html']])

  unordered_list(:outside_section, id: 'outer')
end

class InputSection
  include CapybaraPageObject::PageObject

  def value
    root.value
  end
end

class SectionElementsPage
  include CapybaraPageObject::PageObject

  #page_section(:container, Container, :id => 'div_id')
  #page_sections(:page_inputs, InputSection, :tag_name => 'input')
end

