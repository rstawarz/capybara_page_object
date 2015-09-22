class FramePage
  include CapybaraPageObject::PageObject

  #in_frame(:index => 1) do |frame|
    #text_field(:text_field_2_index, :name => 'recieverElement', :frame => frame)
  #end
  #in_frame(:index => 0) do |frame|
    #text_field(:text_field_1_index, :name => 'senderElement', :frame => frame)
  #end

  #in_frame(:id => 'frame_two_2') do |frame|
    #text_field(:text_field_2_id, :name => 'recieverElement', :frame => frame)
  #end
  #in_frame(:id => 'frame_one_1') do |frame|
    #text_field(:text_field_1_id, :name => 'senderElement', :frame => frame)
  #end

  #in_frame(:name => 'frame2') do |frame|
    #text_field(:text_field_2_name, :name => 'recieverElement', :frame => frame)
  #end
  #in_frame(:name => 'frame1') do |frame|
    #text_field(:text_field_1_name, :name => 'senderElement', :frame => frame)
  #end

  #in_frame(:id => /frame_two_\d+/) do |frame|
    #text_field(:text_field_2_regex, :name => 'recieverElement', :frame => frame)
  #end

end

