module CapybaraPageObject
  class Element
    attr_accessor :element,
                  :page

    def initialize(element, page)
      @element = element
      @page = page
    end

    def attribute(name)
      element[name.to_s]
    end

    def enabled?
      !element.disabled?
    end

    def class
      attribute('class')
    end
    alias_method :class_name, :class

    def focus
      bridge.executeScript("return arguments[0].focus()", native)
    end

    def parent
      raise Capybara::NotSupportedByDriverError unless javascript_enabled?
      element.parent
    end

    def html
      case native.class.to_s
      when /Nokogiri/
        native.to_html
      when /Selenium/
        native['outerHTML']
      else
        raise "This driver is not supported for retrieving the html of an element"
      end
    end

    def native
      element.native
    end

    def scroll_into_view
      unless element.native.respond_to?(:location_once_scrolled_into_view)
          raise "Selenium javascript driver required to use 'scroll_into_view'"
      end
      element.native.location_once_scrolled_into_view
    end

    def method_missing(method_name, *arguments, &block)
      if element.respond_to?(method_name, true)
        element.send(method_name, *arguments, &block)
      elsif value = element[method_name.to_s]
        value
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      element.respond_to?(method_name, include_private) ||
        element[method_name.to_s] != nil ||
        super
    end

    def within(&block)
      page.within(element, &block)
    end

    private

    def bridge
      native.instance_variable_get(:@bridge)
    end

    def javascript_enabled?
      Capybara.current_driver == Capybara.javascript_driver
    end
  end
end
