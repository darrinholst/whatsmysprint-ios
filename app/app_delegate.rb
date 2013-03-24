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

class AppDelegate
  #include WebStub::API

  #alias_method "application_orig:didFinishLaunchingWithOptions:", "application:didFinishLaunchingWithOptions"

  #def application(application, didFinishLaunchingWithOptions:launchOptions)
    #p "overridden"
    #p WebStub::Protocol
    #WebStub::Protocol.stub_request(:get, "http://still-atoll-1597.herokuapp.com/sprint/current")
                     #.to_return(body: '{"id":4,"name":"15-2","start":1363651200000,"end":1364860740000}')

    #application_orig(application, didFinishLaunchingWithOptions: launchOptions)
  #end
end

