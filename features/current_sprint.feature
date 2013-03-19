Feature: Show current sprint

Scenario: Pull current sprint from the interwebs and display it
  Given I expect "15-2" to be the current sprint
  When I launch the app
  Then I should see a navigation bar titled "Current Sprint"
  Then I should see a label with the text "15-2 is your current sprint!"

