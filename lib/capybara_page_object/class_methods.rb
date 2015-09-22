module CapybaraPageObject
  module ClassMethods
    #
    # Set some values that can be used within the class.  This is
    # typically used to provide values that help build dynamic urls in
    # the page_url method
    #
    # @param [Hash] the value to set the params
    #
    def params=(the_params)
      @params = the_params
    end

    #
    # Return the params that exist on this page class
    #
    def params
      @params ||= {}
    end

    #
    # Specify the url for the page.  A call to this method will generate a
    # 'goto' method to take you to the page.
    #
    # @param [String] the url for the page.
    # @param [Symbol] a method name to call to get the url
    #
    def page_url(url)
      define_method("goto") do
        visit self.page_url_value
      end

      define_method('page_url_value') do
        url
      end
    end

    #
    # Creates a method that compares the expected_title of a page against the actual.
    # @param [String] expected_title the literal expected title for the page
    # @param [Regexp] expected_title the expected title pattern for the page
    # @return [boolean]
    # @raise An exception if expected_title does not match actual title
    #
    # @example Specify 'Google' as the expected title of a page
    #   expected_title "Google"
    #   page.has_expected_title?
    #
    def expected_title(expected_title)
      define_method("has_expected_title?") do
        page.has_title?(expected_title)
      end
    end

    #
    # Creates a method that provides a way to initialize a page based upon an expected element.
    # This is useful for pages that load dynamic content.
    # @param [Symbol] the name given to the element in the declaration
    # @param [optional, Integer] timeout default value is 5 seconds
    # @return [boolean]
    #
    # @example Specify a text box named :address expected on the page within 10 seconds
    #   expected_element(:address, 10)
    #   page.has_expected_element?
    #
    def expected_element(element_name)
      define_method("has_expected_element?") do
        args = self.send("#{element_name}_selector")
        page.assert_selector(*args)
        true
      end
    end

    #
    # Creates a method that provides a way to initialize a page based upon an expected element to become visible.
    # This is useful for pages that load dynamic content and might have hidden elements that are not shown.
    # @param [Symbol] the name given to the element in the declaration
    # @param [optional, Integer] timeout default value is 5 seconds
    # @param [optional, boolean] also check that element to be visible if set to true
    # @return [boolean]
    #
    # @example Specify a text box named :address expected on the page within 10 seconds
    #   expected_element_visible(:address, 10)
    #   page.has_expected_element_visible?
    #
    def expected_element_visible(element_name, timeout=Capybara.default_wait_time)
      define_method("has_expected_element_visible?") do
        expect(self.send("#{element_name}_element")).to be_visible
      end
    end

    #
    # adds a method to return a collection of generic Element objects
    # for a specific tag.
    #
    #def elements(name, tag=:element, identifier={:index => 0}, &block)
      ## default tag to :element
      ##
      ## elements 'button', css: 'some css'
      ##
      ## is the same as
      ##
      ## elements 'button', :element, css: 'some css'
      ##
      #if tag.is_a?(Hash)
        #identifier = tag
        #tag        = :element
      #end

      #define_method("#{name}_elements") do
        #return call_block(&block) if block_given?
        #platform.elements_for(tag, identifier.clone)
      #end
    #end

    #
    # adds a method to return a page object rooted at an element
    #
    # @example
    #   page_section(:navigation_bar, NavigationBar, :id => 'nav-bar')
    #   # will generate 'navigation_bar' and 'navigation_bar?'
    #
    #def page_section(name, section_class, identifier)
      #define_method(name) do
        #platform.page_for(identifier, section_class)
      #end
    #end

    #
    # adds a method to return a collection of page objects rooted at elements
    #
    # @example
    #   page_sections(:articles, Article, :class => 'article')
    #   # will generate 'articles'
    #
    #def page_sections(name, section_class, identifier)
      #define_method(name) do
        #platform.pages_for(identifier, section_class)
      #end
    #end

    #
    # adds a method that will return an indexed property.  The property will respond to
    # the [] method with an object that has a set of normal page_object properties that
    # correspond to the definitions included in the identifier_list parameter, with the
    # "what" of the "how and what" substituted based on the index provided to the []
    # method.
    #
    # @example
    #   indexed_property(:title, [
    #     [:text_field,  :field_1,   :id => 'table[%s].field_1'],
    #     [:button,      :button_1,  :id => 'table[%s].button_1'],
    #     [:text_field,  :field_2,   :name => 'table[%s].field_2']
    #   ])
    #   # will generate a title method that responds to [].  title['foo'] will return an object
    #   # that responds to the normal methods expected for two text_fields and a button with the
    #   # given names, using the given how and what with 'foo' substituted for the %s.  title[123]
    #   # will do the same, using the integer 123 instead.
    #
    #
    #def indexed_property (name, identifier_list)
      #define_method("#{name}") do
        #IndexedProperties::TableOfElements.new(@browser, identifier_list)
      #end
    #end

    def add_element_accessor_method(name, element_klass, finder_options)
      finder_options = finder_options.dup
      finder_args = extract_finder_args(finder_options)
      element_klass ||= CapybaraPageObject::Element
      define_method("#{name}_element") do
        e = find(*finder_args)
        element_klass.new(e, self)
      end
      define_method("#{name}_selector") do |options={}|
        [finder_args.first,
         finder_args[1],
         finder_args[2].merge(options)]
      end
    end

    def add_element_query_method(name, finder_options)
      finder_options = finder_options.dup
      finder_args = extract_finder_args(finder_options)
      define_method("has_#{name}?") do |options = {}|
        args = self.send("#{name}_selector", options)
        has_selector?(*args)
      end
      define_method("has_no_#{name}?") do |options = {}|
        args = self.send("#{name}_selector", options)
        has_no_selector?(*args)
      end
      define_method("assert_has_#{name}") do |options = {}|
        args = self.send("#{name}_selector", options)
        assert_selector(*args)
      end
      define_method("assert_has_no_#{name}") do |options = {}|
        args = self.send("#{name}_selector", options)
        assert_no_selector(*args)
      end
    end

    def add_value_accessor_method(name)
      define_method(name) do
        self.send("#{name}_element").value
      end
    end

    def add_text_accessor_method(name)
      define_method(name) do
        self.send("#{name}_element").text
      end
    end

    def add_value_mutator_method(name)
      define_method("#{name}=") do |value|
        self.send("#{name}_element").set(value)
      end
    end

    def add_click_method(name)
      define_method(name) do
        self.send("#{name}_element").click
      end
    end

    def extract_finder_args(finder_options={})
      finder_type, finder_param = extract_finder_type!(finder_options, :class, :css, :id, :xpath)
      finder_options.delete(finder_type)
      case finder_type
        when :class
          [:css, ".{finder_param}", finder_options]
        when :id
          [:css, "##{finder_param}", finder_options]
        when :css
          [finder_type, finder_param, finder_options]
        when :xpath
          [finder_type, finder_param, finder_options]
        else
          raise "oops"
      end
    end

    def extract_finder_type!(options, *types)
      found_keys = options.select{|k,v| types.include?(k)}
      unless found_keys.length == 1
        raise "Incorrect finder type specified '#{found_keys.keys.join(', ')}' - only one of #{types.join(', ')} can be specified at a time."
      end
      found_keys.to_a.first
    end
  end
end
