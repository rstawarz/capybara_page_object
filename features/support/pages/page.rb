require 'pry'
class Page
  include CapybaraPageObject::PageObject

  page_url('/html/static_elements.html')

  expected_title "Static Elements Page"
  expected_element :hello0

  link(:hello0, id: "hello0")
  link(:hello42, id: "hello42")
  #link(:hello1, {:text => "Hello", :index => 1})
  #link(:hello2, {:text => "Hello", :index => 2})

  area(:area_id, id: 'area')
  area(:area_css, css: '.area')
  area(:area_xpath, xpath: '//*[@id="area"]')

  audio(:audio_id, id: 'audio')
  audio(:audio_css, css: '.audio')
  audio(:audio_xpath, xpath: '//audio')

  b(:b_id, id: 'b_id')
  b(:b_css, css: '.b_class')
  b(:b_xpath, xpath: '//b')

  button(:button_id, id: 'button_id')
  button(:button_css, css: '.button_class')
  button(:button_xpath, xpath: "//input[@name='button_name']")
  button(:button_image_id, id: 'button_image_id')
  button(:btn_id, id: 'btn_id')
  button(:btn_css, css: '.btn_class')
  button(:btn_text, css: 'button', :text => 'Click Me Too')
  button(:btn_value, css: "input[value='Click Me']")
  button(:disabled_button, css: "input[value='Disabled']")
  button(:button_button, id: 'button_button')
  button(:input_button, id: 'input_button')

  canvas(:canvas_id, id: 'canvas')
  canvas(:canvas_css, css: '.canvas')
  canvas(:canvas_xpath, xpath: '//canvas')

  checkbox(:cb_id, id: 'cb_id')
  checkbox(:cb_css, css: '.cb_class')
  checkbox(:cb_xpath, xpath: "//input[@type='checkbox']")

  div(:div_id, id: 'div_id')
  div(:div_css, css: '.div_class')
  div(:div_xpath, xpath: "//div[@title='div_title']")
  div(:div_onfocus_test, id: 'onfocus_test')

  file_field(:file_field_id, id: 'file_field_id')
  file_field(:file_field_css, css: '.file_field_class')
  file_field(:file_field_xpath, xpath: "//input[@type='file']")

  form(:form_id, id: 'form_id')
  form(:form_css, css: '.form_class')
  form(:form_xpath, xpath: "//form[@name='form_name']")

  text_field(:text_field_id, css: "#text_field_id")
  text_field(:text_field_css, css: ".text_field_class")
  text_field(:text_field_xpath, xpath: "//input[@type='text' and @name='text_field_name']")
  text_field(:onfocus_text_field, css: "#onfocus_text_field")

  text_area(:text_area_id, css: "#text_area_id")
  text_area(:text_area_css, css: ".text_area_class")
  text_area(:text_area_xpath, xpath: "//textarea")

  h1(:h1_id, id: 'h1_id')
  h1(:h1_css, css: '.h1_class')
  h1(:h1_xpath, xpath: '//h1')

  h2(:h2_id, id: 'h2_id')
  h2(:h2_css, css: '.h2_class')
  h2(:h2_xpath, xpath: '//h2')

  h3(:h3_id, id: 'h3_id')
  h3(:h3_css, css: '.h3_class')
  h3(:h3_xpath, xpath: '//h3')

  h4(:h4_id, id: 'h4_id')
  h4(:h4_css, css: '.h4_class')
  h4(:h4_xpath, xpath: '//h4')

  h5(:h5_id, id: 'h5_id')
  h5(:h5_css, css: '.h5_class')
  h5(:h5_xpath, xpath: '//h5')

  h6(:h6_id, id: 'h6_id')
  h6(:h6_css, css: '.h6_class')
  h6(:h6_xpath, xpath: '//h6')

  hidden_field(:hidden_field_id, css: "#hidden_field_id", visible: false)
  hidden_field(:hidden_field_css, css: ".hidden_field_class")
  hidden_field(:hidden_field_xpath, xpath: "//input[@type='hidden']")

  image(:image_id, id: 'image_id')
  image(:image_css, css: '.image_class')
  image(:image_xpath, xpath: '//img[2]')

  label(:label_id, id: 'label_id')
  label(:label_css, css: '.label_class')
  label(:label_xpath, xpath: '//label[7]')

  link(:google_search_id, css: "#link_id")
  link(:google_search_css, css: ".link_class")
  link(:google_search_xpath, xpath: "//a[text()='Google Search']")

  list_item(:li_id, id: 'li_id')
  list_item(:li_css, css: '.li_class')
  list_item(:li_xpath, xpath: '//ul/li[1]')

  ordered_list(:ol_id, id: 'ol_id')
  ordered_list(:ol_css, css: '.ol_class')
  ordered_list(:ol_xpath, xpath: '//ol')

  paragraph(:p_id, id: 'p_id')
  paragraph(:p_css, css: '.p_class')
  paragraph(:p_xpath, xpath: '//p[@name="p_name"]')

  radio_button(:milk_id, id: 'milk_id')
  radio_button(:milk_css, css: '.milk_class')
  radio_button(:milk_xpath, xpath: "//input[@type='radio'][@name='milk_name']")
  radio_button(:butter_id, id: 'butter_id')
  radio_button_group(:favorite_cheese, css: "input[name='fav_cheese']")

  select_list(:sel_list_id, css: "#sel_list_id")
  select_list(:sel_list_css, css: ".sel_list_class")
  select_list(:sel_list_xpath, xpath: "//select[@name='sel_list_name']")
  select_list(:sel_list_multiple, css: "#sel_list_multiple")

  span(:span_id, id: 'span_id')
  span(:span_css, css: '.span_class')
  span(:span_xpath, xpath: '//span')

  table(:table_id, id: 'table_id')
  table(:table_css, css: '.table_class')
  table(:table_xpath, xpath: "//table[@name='table_name']")
  table(:table_with_thead_id, id: 'table_with_thead_id')
  #table(:table_index, :index => 0)
  #table(:table_name, :name => 'table_name')
  #table(:table_class, :class => 'table_class')
  #table(:table_class_index, :class => "table_class", :index => 0)
  #table(:table_name_index, :name => "table_name", :index => 0)

  cell(:cell_id, id: 'cell_id')
  cell(:cell_css, css: '.cell_class')
  cell(:cell_xpath, xpath: '//table[1]//tr[2]//td[2]')

  row(:tr_id, id: 'tr_id')
  #row(:tr_class, :class => 'tr_class')
  row(:tr_css, css: '.tr_class')
  #row(:tr_index, :index => 1)
  #row(:tr_text, :text => 'Data1 Data2')
  row(:tr_xpath, xpath: "//table[@id='table_id']//tbody//tr[1]")
  #row(:tr_class_index, :class => "tr_class", :index => 0)
  #row(:tr_name_index, :name => "tr_name", :index => 0)

  unordered_list(:ul_id, id: 'ul_id')
  #unordered_list(:ul_name, :name => 'ul_name')
  #unordered_list(:ul_class, :class => 'ul_class')
  unordered_list(:ul_css, css: '.ul_class')
  #unordered_list(:ul_index, :index => 0)
  unordered_list(:ul_xpath, xpath: '//ul')
  #unordered_list(:ul_class_index, :class => "ul_class", :index => 0)
  #unordered_list(:ul_name_index, :name => "ul_name", :index => 0)

  #button(:alert_button, id: 'alert_button')
  #button(:alert_button_that_reloads, id: 'alert_button_that_reloads')
  #button(:confirm_button, id: 'confirm_button')
  #button(:confirm_button_that_reloads, id: 'confirm_button_that_reloads')
  #button(:prompt_button, id: 'prompt_button')

  #link(:open_window, :text => 'New Window')
  #link(:open_another_window, :text => 'Another New Window')
  link(:child, id: 'child')

  video(:video_id, id: 'video')
  video(:video_css, css: '.video')
  video(:video_xpath, xpath: '//video')

  element(:article_id, id: 'article_id')
  element(:header_id, id: 'header_id')
  element(:footer_id, id: 'footer_id')
  element(:summary_id, id: 'summary_id')
  element(:details_id, id: 'details_id')

 #figure(:figure_id, id: 'figure_id')

  svg(:svg_id, id: 'the_svg')

end

