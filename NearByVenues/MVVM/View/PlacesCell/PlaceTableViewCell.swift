//
//  PlaceTableViewCell.swift
//  NearByVenues
//
//  Created by Chaudhari, Dipak Bharat (external - Project) on 12/07/22.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var addressLabel:UILabel!
    @IBOutlet var categoryLabel:UILabel!
    @IBOutlet var distanceLabel:UILabel!
    
    @IBOutlet var thumbnailImageView: LazyImageView?
    
    var place:Place!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setCellData(_place:Place) {
        self.place = _place
        
        
        if let placeName = place.name {
            self.titleLabel.text = placeName
        }
        
        if let address = place.location?.formatted_address {
            self.addressLabel.text = address
        } else if let address = place.location?.address {
            self.addressLabel.text = address
        }
        
        if let category = place.categories?.first?.name {
            self.categoryLabel.text = category
        }
        
        if let distance = place.distance {
            self.distanceLabel.text = "\(Float(distance).getMiles()) mi"
        }
        
        if let prefix = place.categories?.first?.icon?.prefix, let suffix = place.categories?.first?.icon?.suffix {
            
            let iconString = "\(prefix)\(Constants.kIconDimension)\(suffix)"
            if let url = URL(string: iconString) {
                print(iconString)
                self.thumbnailImageView?.loadImage(imageURL: url, placeholderImage: "")
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
