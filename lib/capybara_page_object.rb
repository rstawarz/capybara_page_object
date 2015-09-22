require 'capybara'
require "capybara_page_object/version"

base = File.join(File.dirname(__FILE__), 'capybara_page_object')
require File.join(base, 'elements', 'element.rb')
Dir.glob(File.join(base, 'elements', '**', '*.rb'), &method(:require))

require 'capybara_page_object/class_methods'
require 'capybara_page_object/element_class_methods'
require 'capybara_page_object/page_object'
require 'capybara_page_object/page_factory'
