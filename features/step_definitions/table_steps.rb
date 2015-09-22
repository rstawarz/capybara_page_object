Then /^the data for row "([^\"]*)" should be "([^\"]*)" and "([^\"]*)"$/ do |row, col1, col2|
  row = (row.to_i - 1) if row.to_i > 0
  table_row = @element[row]
  expect(table_row[0].text).to eq(col1)
  expect(table_row[1].text).to eq(col2)
end


When /^I retrieve the data from the table cell$/ do
  @cell_data = @page.cell_id
end

Then /^the cell data should be '([^"]*)'$/ do |expected|
  expect(@cell_data).to eq(expected)
end

When /^I retrieve a table element by "([^\"]*)"$/ do |how|
  @element = @page.send "table_#{how}_element"
end

When /^I retrieve a table element by "([^\"]*)" and "([^\"]*)"$/ do |param1, param2|
  @element = @page.send "table_#{param1}_#{param2}_element"
end

When /^I retrieve a table element while the script is executing$/ do
  @element = @page.table_element(:id => 'table_id')
end

Then /^the data for the first row should be "([^\"]*)" and "([^\"]*)"$/ do |col1, col2|
  expect(@element.first_row[0].text).to eq(col1)
  expect(@element.first_row[1].text).to eq(col2)
end

Then /^the data for the second row should be "([^\"]*)" and "([^\"]*)"$/ do |col1, col2|
  expect(@element[1][0].text).to eq(col1)
  expect(@element[1][1].text).to eq(col2)
end

Then /^the data for the last row should be "([^\"]*)" and "([^\"]*)"$/ do |col1, col2|
  expect(@element.last_row[0].text).to eq(col1)
  expect(@element.last_row[1].text).to eq(col2)
end

Then /^I should see that the table exists$/ do
  expect(@page.table_id?).to eq(true)
end

Then /^the data for column "([^\"]*)" and row "([^\"]*)" should be "([^\"]*)"$/ do |column, row, value|
  expect(@element[row.to_i - 1][column].text).to eq(value)
end

Then /^the data for row "([^\"]*)" and column "([^\"]*)" should be "([^\"]*)"$/ do |row, column, value|
  expect(@element[row][column].text).to eq(value)
end

Then /^the data for row "([^\"]*)" should be nil$/ do |row|
  expect(@element[row]).to be_nil
end

Then /^the data for row "([^\"]*)" and column "([^\"]*)" should be nil$/ do |row, column|
  expect(@element[row][column]).to be_nil
end

Then /^I should see the text includes "([^"]*)" when I retrieve it by "([^"]*)"$/ do |text, how|
  expect(@page.send("table_#{how}")).to include(text)
end

Then /^the table should be like the expected one$/ do |expected_table|
  expect(@element.as_hashes).to eq(expected_table.hashes)
end

Then /^the table should have "([^\"]*)" rows$/ do |rows|
  expect(@element.rows.length).to eq(rows.to_i)
end

Then /^each row should contain "([^\"]*)"$/ do |text|
  @element.each do |row|
    expect(row.text).to include(text)
  end
end

Then /^row "([^\"]*)" should have "([^\"]*)" columns$/ do |row, cols|
  expect(@element[row.to_i - 1].columns.length).to eq(cols.to_i)
end

Then /^each column should contain "([^\"]*)"$/ do |text|
  row = @element[0]
  row.each do |column|
    expect(column.text).to include(text)
  end
end

