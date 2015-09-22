class DoubleClickPage
  include CapybaraPageObject::PageObject

  button(:click, css: 'button')
  paragraph(:p_text, css: '#change_on_double_click')
end

