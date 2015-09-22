When /^I select "([^\"]*)" from the select list$/ do |text|
  @page.sel_list_id = text
end

Then /^the current item should be "([^\"]*)"$/ do |expected_text|
  expect(@page.selected_sel_list_id.text).to eq(expected_text)
end

When /^I search for the select list by "([^\"]*)"$/ do |how|
  @how = how
end

When /^I search for the select list by "([^"]*)" and "([^"]*)"$/ do |param1, param2|
  @how = "#{param1}_#{param2}"
end

Then /^I should be able to select "([^\"]*)"$/ do |value|
  @page.send "sel_list_#{@how}=".to_sym, value
end

Then /^the text for the selected item should be "([^\"]*)"$/ do |value|
  result = @page.send("selected_sel_list_#{@how}").text
  result.should == value
end

When /^I find a select list while the script is executing$/ do
  @select_list = @page.select_list_element(:id => 'sel_list_id')
end

Then /^I should be able to select "([^\"]*)" from the list$/ do |value|
  @select_list.select(value)
end

Then /^I should see that the select list exists$/ do
  expect(@page.sel_list_id?).to be_true
end

Then /^the selected option should be "([^\"]*)"$/ do |text|
  expect(@page.sel_list_id_element.selected_option.text).to eq(text)
end

Then /^the select list should include "([^\"]*)"$/ do |text|
  @page.sel_list_id_options.map(&:text).should include text
end

Then /^the select list should know that "([^\"]*)" is selected$/ do |text|
  @page.sel_list_id_element.selected?(text).should be true
end

Then /^the value for the option should be "([^\"]*)"$/ do |value|
  element = @page.send "sel_list_#{@how}_element"
  element.value.should == value
end

When /^I clear multiple select list$/ do
  @page.sel_list_multiple_element.clear
end

Then /^multiple select list should have no selected options$/ do
  expect(@page.sel_list_multiple_element.selected_options).to be_empty
end

When /^I select an option using the value "([^\"]*)"$/ do |value|
  @page.sel_list_id_element.select_value(value)
end

Then /^the selected option should have a value of "([^\"]*)"$/ do |value|
  @page.sel_list_id_element.selected_values[0].should == value
end

Then /^option "([^\"]*)" should contain "([^\"]*)"$/ do |opt_num, text|
  @options = @page.send("sel_list_#{@how}_options")
  expect(@options[opt_num.to_i - 1].text).to eq(text)
end

Then /^each option should contain "([^\"]*)"$/ do |text|
  options = @page.send("sel_list_#{@how}_options")
  options.each do |option|
    expect(option.text).to include text
  end
end
