class WhatsMySprintController < UIViewController
  TITLE = "What's My Sprint"

  def viewDidLoad
    super
    self.title = TITLE
    view.backgroundColor = "white".to_color
    navigationController.navigationBar.tintColor = "#126116".to_color

    @spinner = UIActivityIndicatorView.alloc.initWithFrame(CGRectMake(0, 0, 20, 20))
    @refresh_button = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemRefresh, target:self, action: "refresh")
  end

  def viewWillAppear(animated)
    super

    @view_initialized ||= begin
      add_subviews
      layout_subviews
      show_current_sprint
      true
    end
  end

  def add_subviews
    view.addSubview(@sprint_label = build_label({
      font: UIFont.systemFontOfSize(50),
      textAlignment: UITextAlignmentCenter,
      numberOfLines: 0
    }))

    view.addSubview(@starts_label = build_label({
      textAlignment: UITextAlignmentRight
    }))

    view.addSubview(@separator_label = build_label({
      textAlignment: UITextAlignmentCenter
    }))

    view.addSubview(@ends_label = build_label({
      textAlignment: UITextAlignmentLeft
    }))
  end

  def layout_subviews
    view.addConstraints(build_visual_constraint("H:|-[sprint_label]-|"))
    view.addConstraints(build_visual_constraint("H:|-[starts_label(==ends_label)]-[separator_label]-[ends_label]-|"))
    view.addConstraints(build_visual_constraint("V:|[sprint_label]-[starts_label(==height)]-|"))
    view.addConstraints(build_visual_constraint("V:|[sprint_label]-[separator_label(==height)]-|"))
    view.addConstraints(build_visual_constraint("V:|[sprint_label]-[ends_label(==height)]-|"))
  end

  def build_label(attributes)
    label = UILabel.alloc.initWithFrame(CGRectZero)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = "#333".to_color
    label.font = UIFont.systemFontOfSize(20)

    attributes.each do |k, v|
      label.send("#{k}=", v)
    end

    label
  end

  def build_visual_constraint(asciiArt)
    views = {
      "sprint_label" => @sprint_label,
      "starts_label" => @starts_label,
      "separator_label" => @separator_label,
      "ends_label" => @ends_label
    }

    metrics = {
      "height"=> 80
    }

    NSLayoutConstraint.constraintsWithVisualFormat(asciiArt, options: 0, metrics: metrics, views: views)
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
    navigationItem.setRightBarButtonItem(UIBarButtonItem.alloc.initWithCustomView(@spinner))
    @spinner.startAnimating
  end

  def stop_spinning
    navigationItem.setRightBarButtonItem(@refresh_button)
  end

  def refresh
    show_current_sprint
  end
end


