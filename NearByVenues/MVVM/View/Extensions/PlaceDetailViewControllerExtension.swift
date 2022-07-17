//
//  PlaceDetailViewControllerExtension.swift
//  NearByVenues
//
//  Created by Chaudhari, Dipak Bharat (external - Project) on 13/07/22.
//

import Foundation
import UIKit


extension PlaceDetailViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        // The size of each item. Pick a suitable height so that the items do not get stacked:
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height*0.3)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        self.collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.placePhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.kPlacePhotoCollectionCellID, for: indexPath as IndexPath) as! PlacePhotoCollectionViewCell
        cell.placePhoto = self.placePhotos[indexPath.row]
        cell.setCellImage()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }

}
