//
//  NearByPlacesViewModel.swift
//  NearByVenues
//
//  Created by Chaudhari, Dipak Bharat (external - Project) on 12/07/22.
//

import Foundation

struct NearByPlacesViewModel {
    
    func fetchNearByPlaces(locationString:String,radius:Int,completionHandler:@escaping(_ result:Places?) -> Void) {
            
        let nearbyPlacesResource = NearbyPlacesResource()
        
        nearbyPlacesResource.getNearbyVenues(locationString: locationString, radius: radius) { result in
            DispatchQueue.main.async {
                completionHandler(result)
            }
        }
    }
}
