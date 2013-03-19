class RootController < UITabBarController
  def initWithNibName(name, bundle: bundle)
    super

    self.viewControllers = [
      buildController(CurrentSprintController, "128-bone", 1),
      buildController(IbCurrentSprintController, "76-baby", 2),
      buildController(AllSprintsController, "109-chicken", 3),
      buildController(MapController, "82-dog-paw", 4)
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
      slidingViewController.underLeftViewController = MenuController.alloc.initWithCallback( -> {
        slidingViewController.resetTopView
      })
    end
  end

  private

  def buildController(clazz, image, index)
    controller = clazz.alloc.initWithNibName(nil, bundle: nil)
    controller.tabBarItem = UITabBarItem.alloc.initWithTitle(clazz::TITLE, image: UIImage.imageNamed(image), tag: index)
    controller.navigationItem.setLeftBarButtonItem(menuButton)

    navController = UINavigationController.alloc.initWithRootViewController(controller)
    navController.view.backgroundColor = "white".to_color

    navController
  end

  def menuButton
    image = UIImage.imageNamed("menu")
    UIBarButtonItem.alloc.initWithImage(image, style: UIBarButtonItemStylePlain, target: self, action: "show_menu")
  end

  def show_menu
    slidingViewController.anchorTopViewTo(ECRight)
  end
end


