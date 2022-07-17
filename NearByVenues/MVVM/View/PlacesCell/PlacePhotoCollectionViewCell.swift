//
//  PlacePhotoCollectionViewCell.swift
//  NearByVenues
//
//  Created by Chaudhari, Dipak Bharat (external - Project) on 13/07/22.
//

import UIKit

class PlacePhotoCollectionViewCell: UICollectionViewCell {

    var placePhoto:PlacePhoto?
    
    @IBOutlet weak var photoImageView: LazyImageView!

    func setCellImage() {
        
        if let prefix = placePhoto?.prefix, let suffix = placePhoto?.suffix {
            
            let iconString = "\(prefix)\(Constants.kPhotoDimension)\(suffix)"
            if let url = URL(string: iconString) {
                print(iconString)
                self.photoImageView?.loadImage(imageURL: url, placeholderImage: "no_image")
                self.photoImageView.contentMode = .scaleAspectFill
            }
        }
    }
}
