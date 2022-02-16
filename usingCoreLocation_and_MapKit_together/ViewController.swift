
import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var mapkitView: MKMapView!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longintudeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    
    let locationManager:CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest ///sharpness setting
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // user permissio
        locationManager.startUpdatingLocation() // start
  }
}

extension ViewController:CLLocationManagerDelegate{
    
    //method of getting latitude, longitude and speed
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let endLocation:CLLocation = locations[locations.count-1] // The last location information is obtained by going to the last index.
        latitudeLabel.text = "Latitude : \(endLocation.coordinate.latitude)"
        longintudeLabel.text = "Longitude : \(endLocation.coordinate.longitude)"
        speedLabel.text = "Speed : \(endLocation.speed)"
        
        // for MapKit
        let location = CLLocationCoordinate2D(latitude: endLocation.coordinate.latitude, longitude: endLocation.coordinate.longitude) // location center
        
        
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02) // zoom
        
        let area = MKCoordinateRegion(center: location, span: span) // selected area
        
        mapkitView.setRegion(area, animated: true) // displaying the location in mapview
        
        //blue dot on the map
        mapkitView.showsUserLocation = true
        
        
        
    }
}
