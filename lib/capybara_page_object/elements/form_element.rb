module CapybaraPageObject
  class FormElement < Element

    def submit
      Capybara.current_session.within(element) do
        first(:css, "input[type='submit']").click
      end
    end

  end
end
