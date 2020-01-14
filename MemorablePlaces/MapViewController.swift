//
//  MapViewController.swift
//  MemorablePlaces
//
//  Created by otet_tud on 1/13/20.
//  Copyright © 2020 otet_tud. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    weak var delegate: PlacesTableViewController?
    var locationManager = CLLocationManager()
    var address : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // This is for the location setup
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // Define Latitude and Longitude of a specific location ex. Ontario
        let latidude : CLLocationDegrees = 43.64//51.25//43.64
        let longitude: CLLocationDegrees = -79.38//-85.32//-79.38

        // Define the Deltas of Latitude and Longitude
        let latDelta : CLLocationDegrees = 1.0
        let longDelta : CLLocationDegrees = 1.0
        
        // Define the Span
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        // Define the location
        let location = CLLocationCoordinate2D(latitude: latidude, longitude: longitude)
        
        // Define the region
        let region = MKCoordinateRegion(center: location, span: span)
        
        // Set MapView with the set region
        mapView.setRegion(region, animated: true)

        // Add a long press gesture
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        mapView.addGestureRecognizer(uilpgr)
    }
    
    @objc func longPress(gestureRecognizer : UIGestureRecognizer) {
        guard let longPress = gestureRecognizer as? UILongPressGestureRecognizer else
          { return }
        
          if longPress.state == .ended { // When gesture end
            let touchPoint = gestureRecognizer.location(in: mapView)
            let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            // PIN Location: Add annotation
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            
        
            
            // Get address for touch coordinates.
            let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                print(error)
            }  else {
                if let placemark = placemarks?[0] {
                    var subThoroufare = ""
                    if placemark.subThoroughfare != nil {
                        subThoroufare = placemark.subThoroughfare!
                    }
                        
                    var thoroufare = ""
                    if placemark.thoroughfare != nil {
                        thoroufare = placemark.thoroughfare!
                    }
                        
                    var subLocality = ""
                    if placemark.subLocality != nil {
                        subLocality = placemark.subLocality!
                    }
                        
                    var subAdministrativeArea = ""
                    if placemark.subAdministrativeArea != nil {
                        subAdministrativeArea = placemark.subAdministrativeArea!
                    }
                    annotation.title = "\(subThoroufare) \(thoroufare) \(subLocality) \(subAdministrativeArea)"
                    self.address = "\(subThoroufare) \(thoroufare) \(subLocality) \(subAdministrativeArea)"
                    print("DEBUG: This is the title \(self.address)")
                    self.addAddress(newAddr : self.address, coordinate : coordinate)
                    
                    }
                }}
            if mapView.annotations.count >= 1 {
                let addr : String = String(mapView.annotations[0].title!!)
                delegate?.removePlace(address: "\(addr)")
                mapView.removeAnnotations(mapView.annotations)
            }
            mapView.addAnnotation(annotation)
          }
    }
    
    func addAddress (newAddr : String, coordinate : CLLocationCoordinate2D) {
        print("DEBUG: This is the title (3) \(newAddr)")
        let newPlace = Place(name: newAddr, coordinate: coordinate)
        delegate?.addPlace(place: newPlace)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
