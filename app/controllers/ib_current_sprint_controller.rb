class IbCurrentSprintController < UIViewController
  extend IB
  include NavigationBarRefresher

  outlet :sprint_label, UILabel
  outlet :starts_on_label, UILabel
  outlet :ends_on_label, UILabel

  TITLE = "IB Current Sprint"

  def viewDidLoad
    super
    self.title = TITLE
    showCurrentSprint
  end

  private

  def refresh
    showCurrentSprint
  end

  def showCurrentSprint
    showRefreshing

    Sprint.current(
      -> (sprint) {
        showRefreshed
        sprint_label.text = "#{sprint.name} is your current sprint!"
        starts_on_label.text = sprint.starts_on
        ends_on_label.text = sprint.ends_on
      },

      -> (message) {
        showRefreshed
        App.alert(message)
      }
    )
  end
end
