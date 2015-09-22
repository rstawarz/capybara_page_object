When /^I search for the audio element by "([^\"]*)"$/ do |how|
  @element = @page.send "audio_#{how}_element"
end

Then /^I should know the audio is not autoplay$/ do
  @element.should_not be_autoplay
end

Then /^I should know that the controls are displayed$/ do
  expect(@element.has_controls?).to eq(true)
end

Then /^I should know that the audio is paused$/ do
  @element.should be_paused
end

Then /^I should know that the duration is greater than (\d+) seconds$/ do |duration|
  (@element.duration.to_f * 60).should > duration.to_f
end

Then /^I should know that its volume is (\d+)$/ do |volume|
  @element.volume.should == volume.to_i
end
