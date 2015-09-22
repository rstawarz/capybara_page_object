module CapybaraPageObject
  class TextFieldElement < Element

    def clear
      element.set('')
    end

    #def value
      #element.text
    #end

  end
end

