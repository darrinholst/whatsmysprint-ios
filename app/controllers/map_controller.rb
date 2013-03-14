class MapController < UIViewController
  include Controller

  TITLE = "WtfAmI?"

  def viewDidLoad
    super
    self.title = TITLE
  end

  def viewWillAppear(animated)
    super

    @views_setup ||= begin
      map = MKMapView.alloc.initWithFrame(view.bounds)
      map.showsUserLocation = true
      map.delegate = self
      view.addSubview(map)
      true
    end
  end

  def mapView(mapView, didUpdateUserLocation: location)
    region = MKCoordinateRegionMakeWithDistance(location.coordinate, 250, 250)
    mapView.setRegion(region, animated: true)
  end
end
