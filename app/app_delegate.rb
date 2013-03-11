class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    UIApplication.sharedApplication.setStatusBarStyle(UIStatusBarStyleBlackOpaque)

    slidingController = ECSlidingViewController.alloc.initWithNibName(nil, bundle: nil)
    slidingController.topViewController = RootController.alloc.init

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible
    @window.rootViewController = slidingController

    true
  end
end

