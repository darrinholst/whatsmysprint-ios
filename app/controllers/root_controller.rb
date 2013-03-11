class RootController < UITabBarController
  def init
    self.initWithNibName(nil, bundle: nil)

    self.viewControllers = [
      controller(CurrentSprintController, "128-bone", 1),
      controller(AllSprintsController, "109-chicken", 2),
    ]

    self
  end

  def viewWillAppear(animated)
    super
    view.addGestureRecognizer(slidingViewController.panGesture)
    view.layer.shadowOpacity = 0.75
    view.layer.shadowRadius = 10.0
    view.layer.shadowColor = UIColor.blackColor.CGColor
    slidingViewController.setAnchorRightRevealAmount(180.0)

    unless slidingViewController.underLeftViewController.isKindOfClass(MenuController.class)
      slidingViewController.underLeftViewController = MenuController.alloc.init
    end
  end

  private

  def controller(clazz, image, index)
    controller = clazz.alloc.init
    controller.tabBarItem = UITabBarItem.alloc.initWithTitle(clazz::TITLE, image: UIImage.imageNamed(image), tag: index)
    UINavigationController.alloc.initWithRootViewController(controller)
  end

end


