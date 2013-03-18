describe CurrentSprintController do
  before do
    Sprint.stub!(:current) do |success, failure|
      success.call(SprintStub.new("99.9", "Tuesday", "Wednesday"))
    end
  end

  tests CurrentSprintController

  it "has some labels" do
    views(UILabel).size.should == 4
  end

  it "shows the current sprint" do
    view("Current Sprint").text.should == "99.9 is your current sprint!"
  end

  it "shows the start date" do
    view("Starts On").text.should == "Tuesday"
  end

  it "shows the end date" do
    view("Ends On").text.should == "Wednesday"
  end
end
