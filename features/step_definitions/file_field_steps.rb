When /^I set the file field to the step definition file$/ do
  @page.file_field_id = __FILE__
end

Then /^its\' value should equal that file$/ do
  full_path = __FILE__
  value = @page.file_field_id
  expect(value).to_not be_nil
  expect(full_path).to include(value)
end

When /^I search for the file field by "([^\"]*)"$/ do |how|
  @how = how
end

When /^I search for the file field by "([^\"]*)" and "([^\"]*)"$/ do |param1, param2|
  @how = "#{param1}_#{param2}"
end

Then /^I should be able to set the file field$/ do
  @page.send "file_field_#{@how}=", __FILE__
end
