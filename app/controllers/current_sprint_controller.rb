class CurrentSprintController < UIViewController
  TITLE = "Current Sprint"

  def viewDidLoad
    super
    self.title = TITLE
    add_subviews
    layout_subviews
    show_current_sprint
  end

  private

  def add_subviews
    view.addSubview(@sprint_label = build_label({
      accessibilityLabel: "Current Sprint",
      font: UIFont.systemFontOfSize(50),
      textAlignment: UITextAlignmentCenter,
      numberOfLines: 0
    }))

    view.addSubview(@starts_label = build_label({
      accessibilityLabel: "Starts On",
      textAlignment: UITextAlignmentRight
    }))

    view.addSubview(@separator_label = build_label({
      accessibilityLabel: "Date Separator",
      textAlignment: UITextAlignmentCenter
    }))

    view.addSubview(@ends_label = build_label({
      accessibilityLabel: "Ends On",
      textAlignment: UITextAlignmentLeft
    }))
  end

  def layout_subviews
    view.addConstraints(build_visual_constraint("H:|-[sprint_label]-|"))
    view.addConstraints(build_visual_constraint("H:|-[starts_label(==ends_label)]-1-[separator_label(15)]-1-[ends_label]-|", NSLayoutFormatAlignAllBaseline))
    view.addConstraints(build_visual_constraint("V:|-10-[sprint_label]-10-[starts_label(==20)]-|"))
    view.addConstraints(build_visual_constraint("V:|-10-[sprint_label]-10-[separator_label(==20)]-|"))
    view.addConstraints(build_visual_constraint("V:|-10-[sprint_label]-10-[ends_label(==20)]-|"))
  end

  def build_label(attributes)
    label = UILabel.alloc.initWithFrame(CGRectZero)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = "#333".to_color
    label.font = UIFont.systemFontOfSize(20)
    #label.layer.setBorderWidth(1.0)

    attributes.each do |k, v|
      label.send("#{k}=", v)
    end

    label
  end

  def build_visual_constraint(asciiArt, options = 0)
    views = {
      "sprint_label" => @sprint_label,
      "starts_label" => @starts_label,
      "separator_label" => @separator_label,
      "ends_label" => @ends_label
    }

    NSLayoutConstraint.constraintsWithVisualFormat(asciiArt, options: options, metrics: nil, views: views)
  end

  def show_current_sprint
    start_spinning

    Sprint.current(
      -> (sprint) {
        stop_spinning
        @sprint_label.text = "#{sprint.name} is your current sprint!"
        @starts_label.text = sprint.starts_on
        @separator_label.text = "-"
        @ends_label.text = sprint.ends_on
      },

      -> (message) {
        stop_spinning
        App.alert(message)
      }
    )
  end

  def start_spinning
    navigationItem.setRightBarButtonItem(UIBarButtonItem.alloc.initWithCustomView(spinner))
    spinner.startAnimating
  end

  def stop_spinning
    navigationItem.setRightBarButtonItem(refresh_button)
  end

  def refresh
    show_current_sprint
  end

  def spinner
    @spinner ||= UIActivityIndicatorView.alloc.initWithFrame(CGRectMake(0, 0, 32, 20))
  end

  def refresh_button
    @refresh_button ||= UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemRefresh, target:self, action: "refresh")
  end
end


