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
      addBikeTrailTo(map)
      performSelector("zoomToBikeTrail:", withObject: map, afterDelay: 1)
      true
    end
  end

  def addBikeTrailTo(map)
    path = NSBundle.mainBundle.pathForResource("BikeTrail", ofType: "kml")
    @parser = KMLParser.alloc.initWithURL(NSURL.fileURLWithPath(path))
    @parser.parseKML
    map.addOverlays(@parser.overlays)
  end

  def zoomToBikeTrail(map)
    zoomTo = nil

    @parser.overlays.each do |overlay|
      zoomTo = zoomTo.nil? ? overlay.boundingMapRect : MKMapRectUnion(zoomTo, overlay.boundingMapRect)
    end

    map.setVisibleMapRect(zoomTo, animated: true)
  end

  def mapView(mapView, didUpdateUserLocation: location)
    #region = MKCoordinateRegionMakeWithDistance(location.coordinate, 250, 250)
    #mapView.setRegion(region, animated: true)
  end

  def mapView(mapView, viewForOverlay: overlay)
    @parser.viewForOverlay(overlay)
  end
end
