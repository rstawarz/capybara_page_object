module CapybaraPageObject
  class SelectListElement < Element

    def selected?(value_or_text)
      option = selected_option
      option.value == value_or_text ||
        option.text == value_or_text
    end

    def selected_option
      within do
        first('option[selected]')
      end
    end

    def clear
      selected_options.each(&:unselect_option)
    end

    def selected_options
      within do
        all('option[selected]')
      end
    end

    def select_value(value)
      within do
        all(:css, "option[@value=#{value}]").each(&:select_option)
      end
    end

    def selected_values
      selected_options.map(&:value)
    end

  end
end

