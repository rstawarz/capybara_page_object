module CapybaraPageObject
  #
  # @example Making the PageFactory available to your step definitions
  #   World(CapybaraPageObject::PageFactory)
  #
  # @example Visiting a page for the first time in a Scenario
  #   goto_page MyPage do |page|
  #      ...
  #   end
  #
  # @example using a page that has already been visited in a Scenario
  #   on_page MyPage do |page|
  #     ....
  #   end
  #
  #
  module PageFactory
    #
    # Create and navigate to a page object.  The navigation will only work if the
    # 'page_url' method was set on the page object.
    #
    # @param [PageObject, String] a class that has included the
    # PageObject module or a string containing the name of the class
    # @param Hash values that is pass through to page class a
    # available in the @params instance variable.
    # @param an optional block to be called
    # @return [PageObject] the newly created page object
    #
    def goto_page(page_class, params={:using_params => {}}, &block)
      new_page(page_class, params, true, &block)
    end

    #
    # Create a page object.
    #
    def new_page(page_class, params={:using_params => {}}, visit=false, &block)
      page_class = class_from_string(page_class) if page_class.is_a? String
      merged = page_class.params.merge(params[:using_params])
      page_class.instance_variable_set("@merged_params", merged) unless merged.empty?
      @current_page = page_class.new(visit)
      block.call @current_page if block
      @current_page
    end

    private

    def class_from_string(str)
      str.split('::').inject(Object) do |mod, class_name|
        mod.const_get(class_name)
      end
    end
  end
end

