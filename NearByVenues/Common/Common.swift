//
//  Common.swift
//
//  Created by Chaudhari, Dipak Bharat (external - Project) on 12/07/22.
//

import Foundation

struct Constants {
    
    // API Constants
    static let kAPIKey = "fsq3dbUzQ+LCQXDmhdUkQMwKek7HLDcTCHkgMzpX4wfDckA="
    static let kIconDimension = "bg_88"  // To obtain an icon, the only acceptable size values are one of: 32, 44, 64, 88, or 120 (pixels)
    static let kPhotoDimension = "400x400"
    static let kPhotoLimit = "3"
    static let kDefaultRadius:Int = 2000
    
    // Alert Constants
    static let ErrorAlertTitle = "Error"
    static let OkAlertTitle = "Ok"
    static let CancelAlertTitle = "Cancel"
    
    // Segue identifier
    static let kPlaceDetailsSegueID = "PlaceDetailViewControllerSegue"
    static let kFilterViewControllerSegueID = "FilterViewControllerSegue"
    
    // Cell identifier
    static let kPlaceTableCellID = "PlaceTableViewCell"
    static let kPlacePhotoCollectionCellID = "PlacePhotoCollectionViewCell"
    
}

 
struct ApiEndpoints
{
    static let places = "https://api.foursquare.com/v3/places/search"
    static let placePhotos = "https://api.foursquare.com/v3/places"  // https://api.foursquare.com/v3/places/{fsq_id}/photos

}

