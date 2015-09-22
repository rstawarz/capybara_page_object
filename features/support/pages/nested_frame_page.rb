class NestedFramePage
  include CapybaraPageObject::PageObject

  #in_frame(:id => 'two') do |frame|
    #in_iframe({:id => 'three'}, frame) do |nested_frame|
      #link(:nested_link, :id => 'four', :frame => nested_frame)
    #end
  #end
end

