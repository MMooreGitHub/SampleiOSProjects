//
//  Annotation.swift
//  BNR_Ch3_7_GlobeTrotter - "Gold Challange"
//
//  Created by Magela Moore on 5/17/17.
//  Copyright © 2017 Rainbow Interactive. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class Annotation : NSObject, MKAnnotation{
    
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    
    init (latitude: CLLocationDegrees, longitude: CLLocationDegrees,title: String?, subtitle: String?){
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.title = title
        self.subtitle = subtitle
    }
    
}

/*
 * Extend Annotation. 
 * Note - extenstions must reside outside of the class
 */
extension Annotation {
    var region: MKCoordinateRegion{
        let span = MKCoordinateSpan(latitudeDelta: 22.00, longitudeDelta: 22.00)// Previous:.05
        return MKCoordinateRegion(center: coordinate, span: span)
    }
}


