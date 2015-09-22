class IFramePage
  include CapybaraPageObject::PageObject

  #in_iframe(:id => 'frame_two_2') do |frame|
    #text_field(:text_field_2_id, :name => 'recieverElement', :frame => frame)
  #end
  #in_iframe(:id => 'frame_one_1') do |frame|
    #text_field(:text_field_1_id, :name => 'senderElement', :frame => frame)
  #end

  #in_iframe(:name => 'frame2') do |frame|
    #text_field(:text_field_2_name, :name => 'recieverElement', :frame => frame)
  #end
  #in_iframe(:name => 'frame1') do |frame|
    #text_field(:text_field_1_name, :name => 'senderElement', :frame => frame)
  #end

  #in_iframe(:index => 1) do |frame|
    #text_field(:text_field_2_index, :name => 'recieverElement', :frame => frame)
  #end
  #in_iframe(:index => 0) do |frame|
    #text_field(:text_field_1_index, :name => 'senderElement', :frame => frame)
  #end

  #in_iframe(:class => 'iframe', :name => 'frame2') do |frame|
    #text_field(:text_field_2_multiple_identifiers, :name => 'recieverElement', :frame => frame)
  #end
end

