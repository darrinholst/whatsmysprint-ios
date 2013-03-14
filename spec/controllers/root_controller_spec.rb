describe RootController do
  before do
    @controller = RootController.alloc.init
    @controller.stub!(:slidingViewController, :return => SlidingViewControllerStub.new)
  end

  tests RootController

  it "does something" do
    controller.should_not be_nil
  end
end
