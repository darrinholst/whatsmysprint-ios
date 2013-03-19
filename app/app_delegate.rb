class AppDelegate
  attr_accessor :window

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    UIApplication.sharedApplication.setStatusBarStyle(UIStatusBarStyleBlackOpaque)

    slidingController = ECSlidingViewController.alloc.initWithNibName(nil, bundle: nil)
    slidingController.topViewController = RootController.alloc.initWithNibName(nil, bundle: nil)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible
    @window.rootViewController = slidingController

    true
  end
end

