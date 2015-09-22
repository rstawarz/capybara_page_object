class HoverPage
  include CapybaraPageObject::PageObject

  link(:hello, css: 'a')
end
