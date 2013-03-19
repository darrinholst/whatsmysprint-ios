class MenuController < UITableViewController
  REUSE_IDENTIFIER = "CELL_IDENTIFIER"

  def initWithCallback(completeCallback)
    @completeCallback = completeCallback
    self.initWithNibName(nil, bundle: nil)
  end

  def viewDidLoad
    super
    @data = ["#EPIC", "#BOOM"]
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @data.size
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(REUSE_IDENTIFIER) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: REUSE_IDENTIFIER)
    end

    cell.textLabel.text = @data[indexPath.row]
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: false)
    @completeCallback.call
  end
end
