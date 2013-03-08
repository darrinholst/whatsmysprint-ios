class AllSprintsController < UITableViewController
  TITLE = "All Sprints"
  REUSE_IDENTIFIER = "CELL_IDENTIFIER"

  def viewDidLoad
    super
    setup_view
    @sprints = []
  end

  def viewWillAppear(animated)
    super

    Sprint.all(
      -> (sprints) {
        @sprints = sprints
        tableView.reloadData
      },

      -> (message) {
        App.alert(message)
      }
    )
  end

  private

  def setup_view
    self.title = TITLE
    view.backgroundColor = "white".to_color
    navigationController.navigationBar.tintColor = "#126116".to_color
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
