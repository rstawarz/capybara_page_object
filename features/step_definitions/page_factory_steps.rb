When(/^I visit the "(.*?)"$/) do |page_name|
  @page = goto_page(page_name)
end
