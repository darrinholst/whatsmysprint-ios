class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    UIApplication.sharedApplication.setStatusBarStyle(UIStatusBarStyleBlackOpaque)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible
    @controller = WhatsMySprintController.alloc.initWithNibName(nil, bundle: nil)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(@controller)
    true
  end
end
