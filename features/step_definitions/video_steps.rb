
When /^I retrieve the video element$/ do
  @element = @page.video_id_element
end

When /^I search for the video element by "([^\"]*)"$/ do |how|
  @element = @page.send "video_#{how}_element"
end

When /^I search for the video element by "([^\"]*)" and "([^\"]*)"$/ do |param1, param2|
  @element = @page.send "video_#{param1}_#{param2}_element"
end

Then /^I should know the video is not autoplay$/ do
  expect(@element).to_not be_autoplay
end

Then /^I should know that the video is paused$/ do
  expect(@element).to be_paused
end

Then /^I should know that its height is (\d+) pixels$/ do |height|
  expect(@element.height).to eq(height)
end

Then /^I should knot what its width is (\d+) pixels$/ do |width|
  expect(@element.width).to eq(width)
end

Then /^I should know that it has not ended$/ do
  expect(@element).to_not be_ended
end

Then /^I should know that it is not seeking$/ do
  expect(@element).to_not be_seeking
end

Then /^I should know that it is not in a loop$/ do
  expect(@element).to_not be_loop
end

Then /^I should know that it is muted$/ do
  expect(@element).to_not be_muted
end

