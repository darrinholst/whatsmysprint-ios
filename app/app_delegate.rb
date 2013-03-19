class AppDelegate
  attr_accessor :window

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    UIApplication.sharedApplication.setStatusBarStyle(UIStatusBarStyleBlackOpaque)
    UINavigationBar.appearance.setTintColor("#126116".to_color)
    UIRefreshControl.appearance.setTintColor("#126116".to_color)


    slidingController = ECSlidingViewController.alloc.initWithNibName(nil, bundle: nil)
    slidingController.topViewController = RootController.alloc.initWithNibName(nil, bundle: nil)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible
    @window.rootViewController = slidingController

    true
  end
end

