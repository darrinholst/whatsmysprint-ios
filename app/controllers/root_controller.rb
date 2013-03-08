class RootController < UITabBarController
  def initWithNibName(name, bundle: bundle)
    super

    self.viewControllers = [
      controller(CurrentSprintController, "128-bone", 1),
      controller(AllSprintsController, "109-chicken", 2),
    ]

    self
  end

  def controller(clazz, image, index)
    controller = clazz.alloc.initWithNibName(nil, bundle: nil)
    controller.tabBarItem = UITabBarItem.alloc.initWithTitle(clazz::TITLE, image: UIImage.imageNamed(image), tag: index)
    UINavigationController.alloc.initWithRootViewController(controller)
  end
end

