//
//  MapViewController.swift
//  BNR_Ch3_7_GlobeTrotter
//
//  Created by Magela Moore on 5/10/17.
//  Updated: 05/17/2017, 05/18/2017
//  Copyright © 2017 Rainbow Interactive. All rights reserved.
//

import UIKit
import MapKit

//MapViewController is a sub-class of UIViewController
class MapViewController: UIViewController ,CLLocationManagerDelegate,MKMapViewDelegate {
    
    // Globals
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet var zoomButton: UIButton!
    
    var cyclePin = 0
    
    let myHome = (lat: 28.6070, long: -81.1636 , title: "Our House" , subtitle: "Is a very very fine house")
    let jessiesHome = (lat: 29.873649, long: -82.400982 , title: "Jessie's House" , subtitle: "Nice!")
    let annilynnesCity = (lat: 17.955718, long: -77.240515 , title: "Annilynne's City" , subtitle: "Ire, Mon!")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayMapPinAnnotation(latitude: jessiesHome.lat, longitude: jessiesHome.long, title: jessiesHome.title, subtitle: jessiesHome.subtitle)
        displayMapPinAnnotation(latitude: myHome.lat, longitude: myHome.long, title: myHome.title, subtitle: myHome.subtitle)
        displayMapPinAnnotation(latitude: annilynnesCity.lat, longitude: annilynnesCity.long, title: annilynnesCity.title, subtitle: annilynnesCity.subtitle)
    }
    
    
    /*
     * Purpose: This function selects the map type
     */
   @IBAction func selectMapType(_ sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = MKMapType.standard
            break
        case 1:
            mapView.mapType = MKMapType.satellite
            break
        case 2:
            mapView.mapType = MKMapType.hybrid
            break
        default:
            break

        }
    }
    
    /*
     * Purpose: This function Adds the Map Pin Annotation to the Map
     */
    func displayMapPinAnnotation(latitude: CLLocationDegrees, longitude: CLLocationDegrees,title: String? = nil, subtitle: String? = nil){
        let pinAnnotation = Annotation(latitude: latitude, longitude: longitude, title: title, subtitle: subtitle)
        // add the annotation to the map and set the region
        mapView.addAnnotation(pinAnnotation)
        mapView.setRegion(pinAnnotation.region, animated: false)
        
    }
    
    /*  
     *  Purpose: this IBAction cycles through the location 
     *  pins upon invoking the "Zoom to next location"  button
     */
    @IBAction func zoomToLocationTapped(_ sender: UIButton){
        
         var location: CLLocation
         location = CLLocation(latitude: 0, longitude:0)

        //Cycle through the pins upon tap actions
        // and reset to zeop after last pin is zoomed on
        if(cyclePin==0){
            location = CLLocation(latitude: myHome.lat, longitude:myHome.long)
            cyclePin += 1
        }
        else if (cyclePin==1){
             location = CLLocation(latitude: jessiesHome.lat, longitude: jessiesHome.long)
             cyclePin += 1
        }
        else if (cyclePin==2){
            location = CLLocation(latitude: annilynnesCity.lat, longitude: annilynnesCity.long)
             cyclePin = 0
        }

        
        let regionRadius: CLLocationDistance = 4000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        
        //set the region in the mapview
        mapView.setRegion(coordinateRegion, animated: true)
        
        print("Button pressed 👍")// slick!
        
    
    }
    
}


