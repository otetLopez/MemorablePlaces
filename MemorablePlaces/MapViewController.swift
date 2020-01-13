//
//  MapViewController.swift
//  MemorablePlaces
//
//  Created by otet_tud on 1/13/20.
//  Copyright © 2020 otet_tud. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    weak var delegate: PlacesTableViewController?
    override func viewDidLoad() {
        super.viewDidLoad()

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
        // Do any additional setup after loading the view.
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
