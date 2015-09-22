module CapybaraPageObject
  class ButtonElement < Element

    def text
      if element.tag_name == 'button'
        element.text
      else
        element.value
      end
    end

  end
end
