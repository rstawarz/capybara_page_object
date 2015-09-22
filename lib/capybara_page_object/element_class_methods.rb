module CapybaraPageObject
  module ElementClassMethods

    def self.define_element_methods(element_name, options = {})
      aliases = options.delete(:aliases) || []
      aliases.each {|name| define_element_methods(name, options) }
      element_klass = options.fetch(:element_class, CapybaraPageObject::Element)
      define_method(element_name) do |name, finder_options|
        add_element_accessor_method(name, element_klass, finder_options)
        add_element_query_method(name, finder_options)
        case options[:default]
        when :text
          add_text_accessor_method(name)
        when :value
          add_value_accessor_method(name)
        when :click
          add_click_method(name)
        end
      end
    end

    define_element_methods(:a, default: :click)
    define_element_methods(:area,  default: :click)
    define_element_methods(:audio, element_class: CapybaraPageObject::MediaElement)
    define_element_methods(:b, default: :text)
    define_element_methods(:button, element_class: CapybaraPageObject::ButtonElement,
                                    default: :click)
    define_element_methods(:canvas)
    define_element_methods(:div, default: :text)
    define_element_methods(:element, default: :text)
    define_element_methods(:form, element_class: CapybaraPageObject::FormElement)
    define_element_methods(:h1, default: :text)
    define_element_methods(:h2, default: :text)
    define_element_methods(:h3, default: :text)
    define_element_methods(:h4, default: :text)
    define_element_methods(:h5, default: :text)
    define_element_methods(:h6, default: :text)
    define_element_methods(:hidden, default: :value,
                                    aliases: [:hidden_field])
    define_element_methods(:image, aliases: [:img])
    define_element_methods(:label, default: :text)
    define_element_methods(:link, default: :click)
    define_element_methods(:list_item, default: :text)
    define_element_methods(:list_item, default: :text, aliases: [:li])
    define_element_methods(:ordered_list, default: :text,
                                          element_class: ListElement,
                                          aliases: [:ol])
    define_element_methods(:paragraph, default: :text,
                                       aliases: [:p])
    define_element_methods(:span, default: :text)
    define_element_methods(:svg, default: :text)
    define_element_methods(:table, element_class: CapybaraPageObject::TableElement,
                                   default: :text)
    define_element_methods(:td, default: :text, aliases: [:cell])
    define_element_methods(:row, element_class: CapybaraPageObject::TableRowElement,
                                 default: :text)
    define_element_methods(:video, element_class: CapybaraPageObject::MediaElement)
    define_element_methods(:ul, default: :text,
                                element_class: CapybaraPageObject::ListElement,
                                aliases: [:unordered_list])

    #
    # adds five methods - one to check, another to uncheck, another
    # to return the state of a checkbox, another to return
    # an element representing the checkbox, and
    # a final method to check the checkbox's existence.
    #
    # @example
    #   checkbox(:active, :name => "is_active")
    #   # will generate
    #   # * 'check_active',
    #   # * 'uncheck_active',
    #   # * 'active_checked?',
    #   # * 'active_element',
    #   # * 'active?'
    #
    def checkbox(name, finder_options)
      add_element_accessor_method(name, CapybaraPageObject::Element, finder_options)
      add_element_query_method(name, finder_options)
      element_name = "#{name}_element"
      define_method("check_#{name}") do
        self.send(element_name).set(true)
      end
      define_method("uncheck_#{name}") do
        self.send(element_name).set(false)
      end
      define_method("#{name}_checked?") do
        self.send(element_name).checked? == true ||
        self.send(element_name).checked? == 'checked'
      end
    end

    #
    # adds three methods - one to set the file for a file field, another to retrieve
    # the file field element, and another to check it's existence.
    #
    # @example
    #   file_field(:the_file, :css, '#file_to_upload')
    #   # will generate
    #   # * 'the_file=',
    #   # * 'the_file_element',
    #   # * 'the_file?'
    #
    def file_field(name, finder_options)
      add_element_accessor_method(name, CapybaraPageObject::Element, finder_options)
      add_element_query_method(name, finder_options)
      define_method("#{name}=") do |value|
        self.send("#{name}_element").set(value)
      end
      define_method("#{name}") do
        self.send("#{name}_element").value
      end
    end

    #
    # adds four methods - one to select, another to return if a radio button
    # is selected, another method to return a PageObject::Elements::RadioButton
    # object representing the radio button element, and another to check
    # the radio button's existence.
    #
    # @example
    #   radio_button(:north, :css, "#north")
    #   # * will generate
    #   # * 'select_north',
    #   # * 'north_selected?',
    #   # * 'north_element',
    #   # * 'north?' methods
    #
    def radio_button(name, finder_options)
      add_element_accessor_method(name, CapybaraPageObject::Element, finder_options)
      add_element_query_method(name, finder_options)
      define_method("select_#{name}") do
        self.send("#{name}_element").set(true)
      end
      define_method("#{name}_selected?") do
        self.send("#{name}_element").selected?
      end
    end
    alias_method :radio, :radio_button

    #
    # adds five methods to help interact with a radio button group -
    # a method to select a radio button in the group by given value/text,
    # a method to return the values of all radio buttons in the group, a method
    # to return if a radio button in the group is selected (will return
    # the text of the selected radio button, if true), a method to return
    # an array of PageObject::Elements::RadioButton objects representing
    # the radio button group, and finally a method to check the existence
    # of the radio button group.
    #
    # @example
    # radio_button_group(:color, :css, "input[name='color']")
    # will generate
    # * 'select_color',
    # * 'color_values',
    # * 'color_selected?',
    # * 'color_elements',
    # * 'color?' methods
    #
    def radio_button_group(name, finder_options)
      finder_options = finder_options.dup
      finder_args = extract_finder_args(finder_options)

      define_method("select_#{name}") do |value|
        elements = self.send("#{name}_elements")
        elements.find {|e| e.value == value }.set(true)
      end
      define_method("#{name}_values") do
        self.send("#{name}_elements").map(&:value)
      end
      define_method("#{name}_selected?") do
        elements = self.send("#{name}_elements")
        selected = elements.select {|e| e.checked? }
        selected.first ? selected.first.value : false
      end
      define_method("#{name}_elements") do
        all(*finder_args)
      end
      define_method("#{name}?") do
        assert_selector(*finder_args)
      end
    end
    alias_method :radio_group, :radio_button_group


    #
    # adds five methods - one to select an item in a drop-down,
    # another to fetch the currently selected item text, another
    # to retrieve the select list element, another to check the
    # drop down's existence and another to get all the available options
    # to select from.
    #
    # @example
    #   select_list(:state, :css, "#state")
    #   # will generate 'state', 'state=', 'state_element', 'state?', "state_options" methods
    #
    def select_list(name, finder_options)
      add_element_accessor_method(name, CapybaraPageObject::SelectListElement, finder_options)
      add_element_query_method(name, finder_options)

      element_name = "#{name}_element"
      define_method(name) do
        self.send(element_name).value
      end
      define_method("selected_#{name}") do
        within(self.send(element_name)) do
          find('option[selected]')
        end
      end
      define_method("#{name}=") do |value|
        element = self.send(element_name)
        within(element) do
          find(:option, value).select_option
        end
      end
      define_method("#{name}_options") do
        element = self.send(element_name)
        within(element) do
          all(:css, 'option')
        end
      end
    end
    alias_method :select, :select_list

    # adds four methods to the page object - one to set text in a text area,
    # another to retrieve text from a text area, another to return the text
    # area element, and another to check the text area's existence.
    #
    # @example
    #   text_area(:address, :css, "#address")
    #   # will generate
    #   # * 'address',
    #   # * 'address=',
    #   # * 'address_element',
    #   # * 'address?'
    #
    #
    def text_area(name, finder_options)
      add_element_accessor_method(name, CapybaraPageObject::TextAreaElement, finder_options)
      add_element_query_method(name, finder_options)
      add_value_accessor_method(name)
      add_value_mutator_method(name)
    end
    alias_method :textarea, :text_area

    def text_field(name, finder_options)
      add_element_accessor_method(name, CapybaraPageObject::TextFieldElement, finder_options)
      add_element_query_method(name, finder_options)
      add_value_accessor_method(name)
      add_value_mutator_method(name)
    end

  end
end

