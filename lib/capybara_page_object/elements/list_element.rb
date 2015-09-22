module CapybaraPageObject
  class ListElement < Element

    def items
      @page.within(element) { all('li') }
    end

    def [](item_index)
      items[item_index]
    end

  end
end

