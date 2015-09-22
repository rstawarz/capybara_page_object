class ModalPage
  include CapybaraPageObject::PageObject

  button(:launch_modal, id: 'launch_modal_button')
end

class ModalDialog
  include CapybaraPageObject::PageObject

  button(:close_window, id: 'close_window')
  button(:close_window_with_delay, id: 'delayed_close')
  button(:launch_another_modal, id: 'launch_modal_button')
end

class AnotherModalDialog
  include CapybaraPageObject::PageObject

  button(:close_window, id: 'close_window2')
  button(:close_window_with_delay, id: 'delayed_close2')
end


