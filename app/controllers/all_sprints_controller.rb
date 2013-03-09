class AllSprintsController < TabController
  TITLE = "All Sprints"
  REUSE_IDENTIFIER = "CELL_IDENTIFIER"

  def viewDidLoad
    super
    self.title = TITLE
    @sprints = []
  end

  def viewWillAppear(animated)
    super

    @view_setup ||= begin
      view.addSubview(@tableView = UITableView.alloc.initWithFrame(view.bounds))
      @tableView.dataSource = self
      @tableView.delegate = self
      true
    end

    Sprint.all(
      -> (sprints) {
        @sprints = sprints
        @tableView.reloadData
      },

      -> (message) {
        App.alert(message)
      }
    )
  end

  private

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
