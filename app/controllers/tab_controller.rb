class TabController < UIViewController
  def init
    self.initWithNibName(nil, bundle: nil)
  end

  def viewDidLoad
    super
    view.backgroundColor = "white".to_color
    navigationController.navigationBar.tintColor = "#126116".to_color
    navigationItem.setLeftBarButtonItem(menu_button)
  end

  private

  def menu_button
    @menu_button ||= begin
      image = UIImage.imageNamed("menu")
      UIBarButtonItem.alloc.initWithImage(image, style: UIBarButtonItemStylePlain, target: self, action: "show_menu")
    end
  end

  def show_menu
    slidingViewController.anchorTopViewTo(ECRight)
  end
end

