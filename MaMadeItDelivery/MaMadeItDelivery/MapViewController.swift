




import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    
    
    let locationManager = CLLocationManager()
    
    
    @IBOutlet var mapView: GMSMapView!
    
    @IBOutlet var addressLabel: UILabel!
    
    @IBOutlet var slide2: UIBarButtonItem!
  
    /*   
    
    
    let query = PFQuery(className:"foodieRequest")
    query.whereKey("username", equalTo:requestUsername)
    query.findObjectsInBackgroundWithBlock {
    (objects: [AnyObject]?, error: NSError?) -> Void in
    
    if error == nil {
    
    
    if let objects = objects as? [PFObject] {
    
    for object in objects {
    
    let query = PFQuery(className:"foodieRequest")
    query.getObjectInBackgroundWithId(object.objectId!) {
    (object: PFObject?, error: NSError?) -> Void in
    if error != nil {
    print(error)
    } else if let object = object {
    
    object["driverResponded"] = PFUser.currentUser()!.username!
    
    object.saveInBackground()
    
    let requestCLLocation = CLLocation(latitude: self.requestLocation.latitude, longitude: self.requestLocation.longitude)
    
    
    CLGeocoder().reverseGeocodeLocation(requestCLLocation, completionHandler: { (placemarks, error) -> Void in
    
    if error != nil {
    
    print(error!)
    
    } else {
    
    if placemarks!.count > 0 {
    
    let pm = placemarks![0] as! CLPlacemark
    
    let mkPm = MKPlacemark(placemark: pm)
    
    var mapItem = MKMapItem(placemark: mkPm)
    
    mapItem.name = self.requestUsername
    
    var launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
    
    mapItem.openInMapsWithLaunchOptions(launchOptions)
    
    
    } else {
    print("Problem with the data received from geocoder")
    }
    
    }
    
    })
    
    
    
    
    
    }
    }
    
    }
    }
    } else {
    
    print(error)
    }
    }
    
    
    }
    
    var requestLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)
    var requestUsername:String = ""
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
    print(requestUsername)
    print(requestLocation)
    
    
    let region = MKCoordinateRegion(center: requestLocation, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    self.map.setRegion(region, animated: true)
    
    var objectAnnotation = MKPointAnnotation()
    objectAnnotation.coordinate = requestLocation
    objectAnnotation.title = requestUsername
    self.map.addAnnotation(objectAnnotation)
    
    }
    
    
    
    */
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
      //  print(requestUsername)
       // print(requestLocation)

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

        let camera = GMSCameraPosition.camera(withLatitude: 41.887,
            longitude:-87.622, zoom:15)
      
        mapView.camera = camera
        let marker = GMSMarker()
        marker.position = (camera?.target)!
        marker.snippet = "Ma Made It"
        //marker.appearAnimation = kGMSMarkerAnimationPop
        marker.map = mapView
        marker.icon = UIImage(named: "MaHead1.png")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        slide2.target = self.revealViewController()
        slide2.action = #selector(SWRevealViewController.revealToggle(_:))
   
        
    }
}
// MARK: - CLLocationManagerDelegate
//1
extension MapViewController: CLLocationManagerDelegate {
    // 2
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // 3
        if status == .authorizedWhenInUse {
            
            // 4
            locationManager.startUpdatingLocation()
            
            //5
            mapView.isMyLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    
    // 6
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            // 7
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            
            // 8
            locationManager.stopUpdatingLocation()
        }
        
    }
    
    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D) {
        
        // 1
        let geocoder = GMSGeocoder()
        
        // 2
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            if let address = response?.firstResult() {
                
                // 3
                let lines = address.lines as! [String]
                self.addressLabel.text = lines.joined(separator: "\n")
                
                // 4
                UIView.animate(withDuration: 0.25, animations: {
                    self.view.layoutIfNeeded()
                    
                    
                    
                }) 
            }
        }
    }
    
  /*  func fetchNearbyPlaces(coordinate: CLLocationCoordinate2D) {
        // 1
        mapView.clear()
        // 2
        dataProvider.fetchPlacesNearCoordinate(coordinate, radius:searchRadius, types: searchedTypes) { places in
            for place: GooglePlace in places {
                // 3
                let marker = PlaceMarker(place: place)
                // 4
                marker.map = self.mapView
            }
        }
    }*/
    
}
extension MapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView!, idleAt position: GMSCameraPosition!) {
        reverseGeocodeCoordinate(position.target)
    }
    
   /* func mapView(mapView: GMSMapView!, markerInfoContents marker: GMSMarker!) -> UIView! {
        // 1
        let placeMarker = marker as! PlaceMarker
        
        // 2
        if let infoView = UIView.viewFromNibName("MarkerInfoView") as? MarkerInfoView {
            // 3
            infoView.nameLabel.text = placeMarker.place.name
            
            // 4
            if let photo = placeMarker.place.photo {
                infoView.placePhoto.image = photo
            } else {
                infoView.placePhoto.image = UIImage(named: "generic")
            }
            
            return infoView
        } else {
            return nil
        }
    }
    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
        mapCenterPinImage.fadeOut(0.25)
        return false
    }*/
  
}
