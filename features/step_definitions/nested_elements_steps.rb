
Given /^I am on the nested elements page$/ do
  pending
  @page = NestedElementsPage.new
  @page.navigate_to(UrlHelper.nested_elements)
end

When /^I search for a link located in a div$/ do
  @link = @page.nested_link_element
end

Then /^I should be able to click the nested link$/ do
  @link.click
end

When /^I search for a button located in a div$/ do
  @button = @page.nested_button_element
end

Then /^I should be able to click the nested button$/ do
  @button.click
end

When /^I search for a text field located in a div$/ do
  @text_field = @page.nested_text_field_element
end

Then /^I should be able to type "([^\"]*)" in the nested text field$/ do |value|
  @text_field.value = value
end

When /^I search for a hidden field located in a div$/ do
  @hidden_field = @page.nested_hidden_field_element
end

Then /^I should be able to see that the nested hidden field contains "([^\"]*)"$/ do |value|
  @hidden_field.value.should == value
end

When /^I search for a text area located in a div$/ do
  @text_area = @page.nested_text_area_element
end

Then /^I should be able to type "([^\"]*)" in the nested text area$/ do |value|
  @text_area.value = value
end

When /^I search for a select list located in a div$/ do
  @select_list = @page.nested_select_list_element
end

Then /^I should be able to select "([^\"]*)" in the nested select list$/ do |value|
  @select_list.select value
end

When /^I search for a checkbox located in a div$/ do
  @checkbox = @page.nested_checkbox_element
end

Then /^I should be able to check the nested checkbox$/ do
  @checkbox.check
end

When /^I search for a radio button located in a div$/ do
  @radio = @page.nested_radio_button_element
end

Then /^I should be able to select the nested radio button$/ do
  @radio.select
end

When /^I search for a div located in a div$/ do
  @div = @page.nested_div_element
end

Then /^I should see the text "([^\"]*)" in the nested div$/ do |value|
  @div.text.should == value
end

When /^I search for a span located in a div$/ do
  @span = @page.nested_span_element
end

Then /^I should see the text "([^\"]*)" in the nested span$/ do |value|
  @span.text.should == value
end

When /^I search for a table located in a div$/ do
  @table = @page.nested_table_element
end

Then /^the data for row "([^\"]*)" of the nested table should be "([^\"]*)" and "([^\"]*)"$/ do |row, col1, col2|
  table_row = @table[row.to_i - 1]
  table_row[0].text.should == col1
  table_row[1].text.should == col2
end

When /^I search the second table cell located in a table in a div$/ do
  @cell = @page.nested_cell_element
end

Then /^the nested table cell should contain "([^\"]*)"$/ do |value|
  @cell.text.should == value
end

When /^I search for an image located in a div$/ do
  @image = @page.nested_image_element
end

Then /^the nested image should be "([^\"]*)" pixels wide$/ do |width|
  @image.width.should == width.to_i
end

Then /^the nested image should be "([^\"]*)" pixels tall$/ do |height|
  @image.height.should == height.to_i
end

When /^I search for a form located in a div$/ do
  @form = @page.nested_form_element
end

Then /^I should be able to submit the nested form$/ do
  @form.submit
end

When /^I search for an ordered list located in a div$/ do
  @list = @page.nested_ordered_list_element
end

Then /^the first nested list items text should be "([^\"]*)"$/ do |value|
  @list[0].text.should == value
end

When /^I search for an unordered list located in a div$/ do
  @list = @page.nested_unordered_list_element
end

When /^I search for a list item nested in an ordered list in a div$/ do
  @li = @page.nested_list_item_element
end

Then /^I should see the nested list items text should be "([^\"]*)"$/ do |value|
  @li.text.should == value
end

When /^I search for a h(\d+) located in a div$/ do |num|
  @header = @page.send "nested_h#{num}_element"
end

Then /^I should see the nested h(\d+)s text should be "([^\"]*)"$/ do |num, value|
  @header.text.should == value
end

When /^I search for a paragraph located in a div$/ do
  @para = @page.nested_paragraph_element
end

Then /^I should see the nested paragraphs text should be "([^\"]*)"$/ do |value|
  @para.text.should == value
end

When /^I search for a file field located in a div$/ do
  @ff = @page.nested_file_field_element
end

Then /^I should be able to set the nested file field$/ do
  @ff.value = __FILE__
end

When /^I get the outter unordered list$/ do
  @list = @page.outer_list_element
end

When /^I get the outter ordered list$/ do
  @list = @page.ordered_outer_element
end

Then /^I should see "([^\"]*)" for list item (\d+)$/ do |text, item_number|
  @list[item_number.to_i - 1].text.should == text
end
