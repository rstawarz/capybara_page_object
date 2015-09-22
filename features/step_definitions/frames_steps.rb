
Given /^I am on the frame elements page$/ do
  pending
  @page = FramePage.new
  @page.navigate_to(UrlHelper.frame_elements)
end

Given /^I am on the iframe elements page$/ do
  pending
  @page = IFramePage.new
  @page.navigate_to(UrlHelper.iframe_elements)
end

When /^I type "([^\"]*)" into the text field for frame 2 using "([^\"]*)"$/ do |text, arg_type|
  @page.send "text_field_2_#{arg_type.gsub(' ', '_')}=".to_sym, text
end

Then /^I should verify "([^\"]*)" is in the text field for frame 2 using "([^\"]*)"$/ do |text, arg_type|
  result = @page.send "text_field_2_#{arg_type.gsub(' ', '_')}".to_sym
  result.should == text
end

#Then /^I should be able to get the text fields text from frame 2 using "([^\"]*)"$/ do |arg_type|
#  @page.send("text_field_2_#{arg_type}_element").text
#end

When /^I type "([^\"]*)" into the text field from frame 1 using "([^\"]*)"$/ do |text, arg_type|
  @page.send "text_field_1_#{arg_type.gsub(' ', '_')}=".to_sym, text
end

Then /^I should verify "([^\"]*)" is in the text field for frame 1 using "([^\"]*)"$/ do |text, arg_type|
  result = @page.send "text_field_1_#{arg_type.gsub(' ', '_')}".to_sym
  result.should == text
end

Given /^I am on the nested frame elements page$/ do
  pending
  @page = NestedFramePage.new
  @page.navigate_to(UrlHelper.nested_frame_elements)
end

Then /^I should be able to click the link in the frame$/ do
  @page.nested_link
  @page.text.should include "Success"
end

When /^I type "([^\"]*)" into the text field from frame 1 identified dynamically$/ do |value|
  @page.in_frame(:id => 'frame_one_1') do |frame|
    @page.text_field_element(:name => 'senderElement', :frame => frame).value = value
  end
end

Then /^I should verify "([^\"]*)" in the text field for frame 1 identified dynamically$/ do |value|
  @page.in_frame(:id => 'frame_one_1') do |frame|
    @page.text_field_element(:name => 'senderElement', :frame => frame).value.should == value
  end
end

When /^I type "([^\"]*)" into the text field from iframe 1 identified dynamically$/ do |value|
  @page.in_iframe(:id => 'frame_one_1') do |frame|
    @page.text_field_element(:name => 'senderElement', :frame => frame).value = value
  end
end

Then /^I should verify "([^\"]*)" in the text field for iframe 1 identified dynamically$/ do |value|
  @page.in_iframe(:id => 'frame_one_1') do |frame|
    @page.text_field_element(:name => 'senderElement', :frame => frame).value.should == value
  end
end

When /^I trigger an alert within a frame$/ do
  @page.in_frame(:id => 'frame_three_3') do |frame|
    @msg = @page.alert(frame) do
      @page.button_element(:id => 'alert_button', :frame => frame).click
    end
  end
end

When /^I trigger a confirm within a frame$/ do
  @page.in_frame(:id => 'frame_three_3') do |frame|
    @msg = @page.confirm(true, frame) do
      @page.button_element(:id => 'confirm_button', :frame => frame).click
    end
  end
end

When /^I trigger a prompt within a frame$/ do
  @page.in_frame(:id => 'frame_three_3') do |frame|
    @msg = @page.prompt("Cheezy", frame) do
      @page.button_element(:id => 'prompt_button', :frame => frame).click
    end
  end
end
