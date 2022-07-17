//
//  PlaceDetailsViewModel.swift
//  NearByVenues
//
//  Created by Chaudhari, Dipak Bharat (external - Project) on 14/07/22.
//

import Foundation

struct PlaceDetailsViewModel {
    
    func getphotosForPlace(_fsq_id_String:String,completionHandler:@escaping(_ result:[PlacePhoto]?) -> Void) {
            
        let placePhotosResource = PlacePhotosResource()
        placePhotosResource.getphotos(fsq_id_String: _fsq_id_String) { photos in
            DispatchQueue.main.async {
                completionHandler(photos)
            }
        }

    }
}
