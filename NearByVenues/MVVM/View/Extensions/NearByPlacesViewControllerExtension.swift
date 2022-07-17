//
//  NearByPlacesViewControllerExtension.swift
//  NearByVenues
//
//  Created by Chaudhari, Dipak Bharat (external - Project) on 13/07/22.
//

import UIKit
import CoreLocation

extension NearByPlacesViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
       print(status)
        manager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        manager.stopUpdatingLocation()
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if refreshControl?.isRefreshing == true {
            refreshControl?.endRefreshing()
        }
        
        if let location = locations.first {
            self.userLocation = location
            
            // After getting current location calling function to get places around the location.
            self.getNearByPlaces()
            
            manager.stopUpdatingLocation()
        }
    }
}
