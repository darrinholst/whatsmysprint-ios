class AllSprintsController < UITableViewController
  TITLE = "All Sprints"
  REUSE_IDENTIFIER = "CELL_IDENTIFIER"

  def viewDidLoad
    super
    self.title = TITLE
    @sprints = []

    @refresh = UIRefreshControl.alloc.init
    @refresh.attributedTitle = NSAttributedString.alloc.initWithString("Pull to refresh")
    self.refreshControl = @refresh
    self.refreshControl.tintColor = "#126116".to_color
    self.refreshControl.addTarget(self, action: :loadData, forControlEvents:UIControlEventValueChanged)
  end

  def viewWillAppear(animated)
    super
    loadData
  end

  private

  def loadData
    @refresh.attributedTitle = NSAttributedString.alloc.initWithString("Refreshing")

    Sprint.all(
      -> (sprints) {
        stopRefreshing
        @sprints = sprints
        tableView.reloadData
      },

      -> (message) {
        stopRefreshing
        App.alert(message)
      }
    )
  end

  def stopRefreshing
    @refresh.endRefreshing
    @refresh.attributedTitle = NSAttributedString.alloc.initWithString("Pull to refresh")
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @sprints.size
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(REUSE_IDENTIFIER) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: REUSE_IDENTIFIER)
    end

    sprint = @sprints[indexPath.row]
    cell.textLabel.text = sprint.name
    cell.detailTextLabel.text = "#{sprint.starts_on} - #{sprint.ends_on}"
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: false)
  end
end
