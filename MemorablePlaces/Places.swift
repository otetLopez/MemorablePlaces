//
//  Places.swift
//  MemorablePlaces
//
//  Created by otet_tud on 1/13/20.
//  Copyright © 2020 otet_tud. All rights reserved.
//

import Foundation
import MapKit

class Place {
    private var name : String
    private var coordinate : CLLocationCoordinate2D

//    init () {
//        self.name = ""
//        self.coordinate = 
//    }
    
    init(name: String, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.coordinate = coordinate
    }

    func getAddress() -> String {
        return self.name
    }
    
    func getCoordinates() -> CLLocationCoordinate2D {
        return self.coordinate
    }
    
}
