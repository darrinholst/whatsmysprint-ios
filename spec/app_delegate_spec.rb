describe AppDelegate do
  before do
    @app = UIApplication.sharedApplication
    @rootViewController = @app.windows.first.rootViewController
  end

  it "sets the status bar to black opaque" do
    @app.statusBarStyle.should == UIStatusBarStyleBlackOpaque
  end

  it "has one window" do
    @app.windows.size.should == 1
  end

  it "sets up a sliding view controller as the root" do
    @rootViewController.should be_a(ECSlidingViewController)
  end

  it "sets the root view controller as the sliders top view" do
    @rootViewController.topViewController.should be_a(RootController)
  end
end
