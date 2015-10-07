Then /^the page should contain the text "([^\"]*)"$/ do |text|
  @page.text.should include text
end

Then /^the page should contain the html "([^\"]*)"$/ do |html|
  @page.html.should include html
end

Then /^the page should have the title "([^\"]*)"$/ do |title|
  @page.title.should include title
end

Then /^I should be able to wait for a block to return true$/ do
  @page.google_search_id
  @page.wait_until(10, "too long to display page") do
    @page.text.include? 'Success'
  end
end

When /^I handle the alert$/ do
  @msg = @page.alert do
    @page.alert_button
  end
end

When /^I handle the possible alert$/ do
  @msg = @page.alert do
    @page.alert_button_element.focus
  end
end

When /^I handle the alert that reloads the page$/ do
  @msg = @page.alert do
    @page.alert_button_that_reloads
  end
end

Then /^I should be able to get the alert\'s message$/ do
  @msg.should == "I am an alert"
end

Then /^I should be able to verify the popup didn\'t have a message$/ do
  @msg.should be_nil
end

When /^I handle the confirm$/ do
  @msg = @page.confirm(true) do
    @page.confirm_button
  end
end

When /^I handle the possible confirm$/ do
  @msg = @page.confirm(true) do
    @page.confirm_button_element.focus
  end
end

When /^I handle the confirm that reloads the page$/ do
  @msg = @page.confirm(true) do
    @page.confirm_button_that_reloads
  end
end

Then /^I should be able to get the confirm message$/ do
  @msg.should == 'set the value'
end

When /^I handle the prompt$/ do
  @msg = @page.prompt("Cheezy") do
    @page.prompt_button
  end
end

When /^I handle the possible prompt$/ do
  @msg = @page.prompt("Cheezy") do
    @page.prompt_button_element.focus
  end
end

Then /^I should be able to get the message and default value$/ do
  @msg[:message].should == "enter your name"
  @msg[:default_value].should == 'John Doe'
end

When /^I open a second window$/ do
  @page.open_window
end

When /^I open a third window$/ do
  @page.open_another_window
end

#class SecondPage
  #include PageObject
#end

Then /^I should be able to attach to a page object using title$/ do
  @second_page = SecondPage.new(@browser)
  @second_page.attach_to_window(:title => "Success")
  @second_page.title.should == "Success"
end

Then /^I should be able to attach to a page object using url$/ do
  @second_page = SecondPage.new(@browser)
  @second_page.attach_to_window(:url => "success.html")
  @second_page.current_url.should include 'success.html'
end

Then /^I should be able to reload the page$/ do
  @page.reload_page
end

When /^I press the back button$/ do
  @page.go_back
end

When /^I press the forward button$/ do
  @page.go_forward
end

Then /^the page should have the expected title$/ do
  @page.should have_expected_title
end

Then /^the page should have the expected element$/ do
  expect(@page).to have_expected_element
end

Then /^the page can assert the (\w*) element is present$/ do |element_name|
  expect(@page.send("has_#{element_name}?")).to eq(true)
  expect(@page.send("has_no_#{element_name}?")).to eq(false)
  expect { @page.send("assert_has_#{element_name}") }.to_not raise_error
  expect { @page.send("assert_has_no_#{element_name}") }.to raise_error(Capybara::ExpectationNotMet)
  expect(@page).to be_loaded
end

Then /^the page can assert the (\w*) element is NOT present$/ do |element_name|
  expect(@page.send("has_#{element_name}?")).to eq(false)
  expect(@page.send("has_no_#{element_name}?")).to eq(true)
  expect { @page.send("assert_has_#{element_name}") }.to raise_error(Capybara::ExpectationNotMet)
  expect { @page.send("assert_has_no_#{element_name}") }.to_not raise_error
end

Then /^the page should not have the expected element$/ do
  class FakePage
    include CapybaraPageObject::PageObject
    expected_element(:blah)
    element(:blah, id: "blah")
  end

  expect{FakePage.new.has_expected_element?}
    .to raise_error(Capybara::ExpectationNotMet)

  expect{FakePage.new.loaded?}
    .to raise_error(Capybara::ExpectationNotMet)
end

Then /^the page should raise an exception when expected eleemnt is not specified$/ do
  class FakeExpectedElementPage
    include CapybaraPageObject::PageObject
  end

  expect{FakeExpectedElementPage.new.loaded?}
    .to raise_error("Must set expected_element to use the `loaded?` method")
end
