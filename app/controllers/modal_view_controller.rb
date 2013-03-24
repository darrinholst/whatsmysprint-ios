class ModalViewController < UIViewController
  extend IB

  def viewDidLoad
    super
    self.title = "Modal"
    dismiss = UIBarButtonItem.alloc.initWithTitle("Done", style: UIBarButtonItemStyleBordered, target:self, action: "dismiss")
    navigationItem.setRightBarButtonItem(dismiss)
  end

  def dismiss
    presentingViewController.dismissViewControllerAnimated(true, completion: nil)
  end
end
