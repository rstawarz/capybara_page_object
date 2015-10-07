module CapybaraPageObject
  # Module that when included adds functionality to a page object.  This module
  # will add numerous class and instance methods that you use to define and
  # interact with web pages.
  #
  # If we have a login page with a username and password textfield and a login
  # button we might define our page like the one below.  We can then interact with
  # the object using the generated methods.
  #
  # @example Login page example
  #   class LoginPage
  #     include PageObject
  #
  #     text_field(:username, :id => 'user')
  #     text_field(:password, :id => 'pass')
  #     button(:login, :value => 'Login')
  #   end
  #
  #   login_page = LoginPage.new
  #   login_page.username = 'ryan'
  #   login_page.password = 'starwars'
  #   login_page.login
  #
  # @see PageObject::ClassMethods to see what class level methods are added to this module at runtime.
  #
  module PageObject
    include Capybara::DSL

    alias_method :navigate_to, :visit
    #
    # Construct a new page object.  Prior to browser initialization it will call
    # a method named initialize_accessors if it exists. Upon initialization of
    # the page it will call a method named initialize_page if it exists.
    #
    #
    def initialize(visit=false)
      initialize_accessors if respond_to?(:initialize_accessors)
      if visit
        raise "Page must specify `page_url` to use visit functionality" unless respond_to?(:goto)
        goto
      end
      initialize_page if respond_to?(:initialize_page)
    end

    def self.included(base)
      base.extend(CapybaraPageObject::ClassMethods)
      base.extend(CapybaraPageObject::ElementClassMethods)
    end

    def within(element, &block)
      if element.kind_of?(CapybaraPageObject::Element)
        super(element.element, &block)
      else
        super(element, &block)
      end
    end

    def loaded?
      unless respond_to?(:has_expected_element?)
        raise "Must set expected_element to use the `loaded?` method"
      end

      has_expected_element?
    end

    def go_back
      page.evaluate_script('window.history.back()')
    end

    def go_forward
      page.evaluate_script('window.history.forward()')
    end

    def reload_page
      url = [ current_path, page.driver.request.env['QUERY_STRING'] ].reject{|s| s.nil? || s == '' }.join('?')
      page.visit url
    end

  end
end
