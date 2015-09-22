class AsyncPage
  include CapybaraPageObject::PageObject
  button(:target, css: { value: 'Target' })
  button(:hide, css: { value:  'Hide Button' } )
  button(:unhide, css: { value:  'Unhide Button' })
  button(:create_button, css: { value:  'Create Button' })
  button(:remove_button, css: { value:  'Remove Button' } )
  button(:created_button, css: { value:  'New Button' })
end

