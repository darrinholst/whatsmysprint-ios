Then /^I should see a label with the text "([^"]*)"$/ do |expected_text|
  check_element_exists( "view:'UILabel' text:'#{expected_text}'" )
end

