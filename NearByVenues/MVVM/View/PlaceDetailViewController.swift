//
//  PlaceDetailViewController.swift
//  NearByVenues
//
//  Created by Chaudhari, Dipak Bharat (external - Project) on 13/07/22.
//

import UIKit

class PlaceDetailViewController: UIViewController {

    var place:Place?
    
    var placeDetailsViewModel:PlaceDetailsViewModel = PlaceDetailsViewModel()
    
    @IBOutlet var collectionView:UICollectionView!
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var addressLabel:UILabel!
    @IBOutlet var countryLabel:UILabel!
    @IBOutlet var categoryLabel:UILabel!
    @IBOutlet var distanceLabel:UILabel!
    
    var placePhotos:[PlacePhoto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupPlaceDetails()
        self.setCollectionViewLayout()
        self.getPhotosForPlace()
        self.setNavigationBar()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.tintColor = .white
        self.title = place?.name
    }
    func getPhotosForPlace() {

        SwiftLoader.show(animated: true)

        if let fsq_id_String = place?.fsq_id {
            self.placeDetailsViewModel.getphotosForPlace(_fsq_id_String: fsq_id_String) { photos in
                self.placePhotos.removeAll()
                self.placePhotos.append(contentsOf: photos!)
                
                DispatchQueue.main.async {
                    if self.placePhotos.count == 0 {
                        self.pageControl.isHidden = true
                        self.collectionView.backgroundView = UIImageView(image: UIImage(named: "no_image"))
                    } else {
                        self.pageControl.numberOfPages = self.placePhotos.count
                        self.collectionView.reloadData()
                    }
                    SwiftLoader.hide()
                }
            }
        }
    }
    
    func setupPlaceDetails() {
        if let placeName = place?.name {
            self.titleLabel.text = placeName
        }
        
        if let address = place?.location?.formatted_address {
            self.addressLabel.text = address
        } else if let address = place?.location?.address {
            self.addressLabel.text = address
        }
        
        if let category = place?.categories?.first?.name {
            self.categoryLabel.text = "Category - \(category)"
        }
        
        if let country = place?.location?.country {
            self.countryLabel.text = "Country - \(country)"
        }
        
        if let distance = place?.distance {
            self.distanceLabel.text = "Distance - \(Float(distance).getMiles()) mi"
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
