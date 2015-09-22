path =File.join(File.dirname(__FILE__), '../../', 'lib')
$LOAD_PATH.unshift(path)

require 'pry'
require 'rspec'
require 'capybara_page_object'

World(CapybaraPageObject::PageFactory)
