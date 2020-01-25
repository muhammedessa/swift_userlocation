//
//  ViewController.swift
//  userlocation
//
//  Created by Muhammed Essa on 1/19/20.
//  Copyright © 2020 Muhammed Essa. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class ViewController: UIViewController , CLLocationManagerDelegate , MKMapViewDelegate{
    
    
    @IBOutlet weak var map: MKMapView!
    

    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self as! CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
      //  print(locations)
        let userLocation : CLLocation = locations[0]
        
        CLGeocoder().reverseGeocodeLocation(userLocation ){
            (placemarks,error) in
            if error != nil {
                print(error!)
            }else{
                if let placemark = placemarks?[0]{
                    var mythoroughfare = ""
                    if placemark.thoroughfare != nil {
                        mythoroughfare =  placemark.thoroughfare!
                    }
                    
                    var subLocality = ""
                    if placemark.subLocality != nil {
                           subLocality =  placemark.thoroughfare!
                                       }
                    
                    var subAdministrativeArea = ""
                    if placemark.subAdministrativeArea != nil {
         subAdministrativeArea =  placemark.subAdministrativeArea!
                                                      }
                    var postalCode = ""
                                   if placemark.postalCode != nil {
                        postalCode =  placemark.postalCode!
                                                                     }
                    let country = ""
                             if placemark.country != nil {
                            postalCode =  placemark.country!
                                                  }
                    
 print( mythoroughfare + " \n" + subLocality + "  \n" + subAdministrativeArea + "  \n" + postalCode + "  \n" + country )
                    
                }
            }
        }
        
//        let latitude = userLocation.coordinate.latitude
//         let longitude = userLocation.coordinate.longitude
//        let latDelta : CLLocationDegrees = 0.05
//        let longDelta : CLLocationDegrees = 0.05
//        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
//        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//        let region = MKCoordinateRegion(center: location, span: span)
//        map.setRegion(region, animated: true)
    }


}

