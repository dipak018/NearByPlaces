//
//  NearbyPlacesResource.swift
//  NearByVenues
//
//  Created by Chaudhari, Dipak Bharat (external - Project) on 12/07/22.
//

import Foundation

struct NearbyPlacesResource {
    
    func getNearbyVenues(locationString:String,radius:Int,completionHandler:@escaping(_ result:Places?) -> Void) {

        let latLongString = "?ll=\(locationString)"
        let radius = "&radius=\(radius)"
        let maxLimit = "&limit=50"
        
        let urlString = "\(ApiEndpoints.places)\(latLongString)\(radius)\(maxLimit)"
        let venuesURL = URL(string: urlString)!
        let httpUtility = HttpUtility()
                
        httpUtility.getApiData(requestURL: venuesURL, resultType: Places.self) { result in
            _=completionHandler(result)
        }
    }
}
