module NavigationBarRefresher
  def showRefreshing
    navigationItem.setRightBarButtonItem(UIBarButtonItem.alloc.initWithCustomView(spinner))
    spinner.startAnimating
  end

  def showRefreshed
    navigationItem.setRightBarButtonItem(refreshButton)
  end

  def spinner
    @spinner ||= UIActivityIndicatorView.alloc.initWithFrame(CGRectMake(0, 0, 32, 20))
  end

  def refreshButton
    @refresh_button ||= UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemRefresh, target:self, action: "refresh")
  end
end
