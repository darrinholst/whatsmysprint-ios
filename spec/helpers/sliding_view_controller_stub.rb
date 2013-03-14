class SlidingViewControllerStub < Struct.new("SlidingViewController", :panGesture)
  def initialize
    self.panGesture = "panGesture"
  end
end
