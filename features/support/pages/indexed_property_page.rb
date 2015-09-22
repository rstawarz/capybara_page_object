class IndexedPropertyPage
  include CapybaraPageObject::PageObject

  #indexed_property :table, [[:text_field, :text_table, {:id => 'table[%s].text'}],
                            #[:text_field, :text_name, {:name => 'tableName[%s].text'}],
                            #[:radio_button, :radio, {:id => 'table[%s].radio'}],
                            #[:checkbox, :check, {:id => 'table[%s].check'}],
                            #[:text_area, :area, {:id => 'table[%s].area'}],
                            #[:button, :button, {:id => 'table[%s].button'}],
                            #[:div, :content, {:id => 'table[%s].content'}],
                            #[:div, :nil?, {:id => 'table[%s].bad_name'}],
                         #]

  #indexed_property :index_table, [[:radio_button, :radio, {:index => '%d'}]]

  #indexed_property :nottable, [[:text_field, :text_nottable, {:id => 'nottable[%s].text'}]]

  #indexed_property :other_table, [
      #[:text_field, :text_table, {:id => 'other_table[%s].text'}],
      #[:div, :content, {:id => 'other_table[%s].content'}]
  #]

end

