class JavascriptPage
  include CapybaraPageObject::PageObject

  text_field(:expression, id: 'calculator-expression')
  text_field(:results, id: 'calculator-result')
  button(:compute, css: { :value => 'Compute' })

end

