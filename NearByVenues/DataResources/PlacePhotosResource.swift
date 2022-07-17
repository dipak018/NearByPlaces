//
//  PlacePhotosResource.swift
//  NearByVenues
//
//  Created by Chaudhari, Dipak Bharat (external - Project) on 14/07/22.
//

import Foundation

struct PlacePhotosResource {
    
    func getphotos(fsq_id_String:String,completionHandler:@escaping(_ result:[PlacePhoto]?) -> Void) {

        let urlString = "\(ApiEndpoints.placePhotos)/\(fsq_id_String)/photos?limit=\(Constants.kPhotoLimit)"
        let venuesURL = URL(string: urlString)!
        let httpUtility = HttpUtility()
                
        httpUtility.getApiData(requestURL: venuesURL, resultType: [PlacePhoto].self) { result in
            _=completionHandler(result)
        }
    }
    
}
