class NestedElementsPage
  include CapybaraPageObject::PageObject

  #div(:outer_div, id: 'div_id')
  #link(:nested_link, id: '???') { |page| page.outer_div_element.link_element }
  #button(:nested_button) { |page| page.outer_div_element.button_element }
  #text_field(:nested_text_field) { |page| page.outer_div_element.text_field_element }
  #hidden_field(:nested_hidden_field) { |page| page.outer_div_element.hidden_field_element }
  #text_area(:nested_text_area) { |page| page.outer_div_element.text_area_element }
  #select_list(:nested_select_list) { |page| page.outer_div_element.select_list_element }
  #checkbox(:nested_checkbox) { |page| page.outer_div_element.checkbox_element }
  #radio_button(:nested_radio_button) { |page| page.outer_div_element.radio_button_element }
  #div(:nested_div) { |page| page.outer_div_element.div_element }
  #span(:nested_span) { |page| page.outer_div_element.span_element }
  #table(:nested_table) { |page| page.outer_div_element.table_element }
  #cell(:nested_cell) { |page| page.nested_table_element.cell_element(:index => 1) }
  #image(:nested_image) { |page| page.outer_div_element.image_element }
  #form(:nested_form) { |page| page.outer_div_element.form_element }
  #ordered_list(:nested_ordered_list) { |page| page.outer_div_element.ordered_list_element }
  #unordered_list(:nested_unordered_list) { |page| page.outer_div_element.unordered_list_element }
  #list_item(:nested_list_item) { |page| page.nested_ordered_list_element.list_item_element }
  #h1(:nested_h1) { |page| page.outer_div_element.h1_element}
  #h2(:nested_h2) { |page| page.outer_div_element.h2_element }
  #h3(:nested_h3) { |page| page.outer_div_element.h3_element }
  #h4(:nested_h4) { |page| page.outer_div_element.h4_element }
  #h5(:nested_h5) { |page| page.outer_div_element.h5_element }
  #h6(:nested_h6) { |page| page.outer_div_element.h6_element }
  #paragraph(:nested_paragraph) { |page| page.outer_div_element.paragraph_element }
  #file_field(:nested_file_field) { |page| page.outer_div_element.file_field_element }

  #unordered_list(:outer_list, id: 'outer')
  #ordered_list(:ordered_outer, id: 'ol-outer')
end
