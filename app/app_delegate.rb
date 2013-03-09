class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    slidingController = ECSlidingViewController.alloc.initWithNibName(nil, bundle: nil)
    slidingController.topViewController = RootController.alloc.initWithNibName(nil, bundle: nil)

    @window.rootViewController = slidingController

    true
  end
end

