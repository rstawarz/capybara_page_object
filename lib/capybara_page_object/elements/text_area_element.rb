module CapybaraPageObject
  class TextAreaElement < Element

    def clear
      element.set('')
    end

  end
end

