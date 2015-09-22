When /^I get the image element$/ do
  @element = @page.image_id_element
end

Then /^the image should be "([^\"]*)" pixels wide$/ do |width|
  @element.width.should == width
end

Then /^the image should be "([^\"]*)" pixels tall$/ do |height|
  @element.height.should == height
end

When /^I get the image element by "([^\"]*)"$/ do |how|
  @element = @page.send "image_#{how}_element"
end

