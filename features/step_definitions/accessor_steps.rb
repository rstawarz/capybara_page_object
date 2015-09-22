Then /^the text should be "([^\"]*)"$/ do |expected_text|
  expect(@text).to eq(expected_text)
end

Then /^the text should include "([^\"]*)"$/ do |expected_text|
  expect(@text).to include(expected_text)
end

Then /^I should be on the success page$/ do
  expect(@page.text).to include('Success')
  expect(@page.title).to eq('Success')
end

Then /^the list items text should be "([^\"]*)"$/ do |expected_text|
  expect(@element.text).to eq(expected_text)
end

When /^I get the first item from the list$/ do
  @element = @list.items[0]
end

Then /^the list should contain (\d+) items$/ do |items|
  expect(@list.items.length).to eq(items.to_i)
end

Then /^each item should contain "([^\"]*)"$/ do |text|
  @list.items.each { |item| expect(item.text).to include(text) }
end
