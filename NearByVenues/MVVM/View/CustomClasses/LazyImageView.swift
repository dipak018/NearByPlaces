//
//  LazyImageView.swift
//
//  Created by Chaudhari, Dipak Bharat (external - Project) on 13/07/22.
//

import UIKit

class LazyImageView : UIImageView {

    private let imageCache = NSCache<AnyObject,UIImage>()
    var gradientLayer = CAGradientLayer()
    var gradientColorOne : CGColor = UIColor(white: 0.75, alpha: 1.0).cgColor
    var gradientColorTwo : CGColor = UIColor(white: 0.95, alpha: 1.0).cgColor
    
    func loadImage(imageURL:URL,placeholderImage:String) {
        
        // Animate while loading
        self.startLoadingAnimation()
        
        // Load image from cache if available
        if let cachedImage = self.imageCache.object(forKey: imageURL as AnyObject) {
            self.stopLoadingAnimation()
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            
            if let imageData = try? Data(contentsOf: imageURL) {
                if let downloadedImage = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.stopLoadingAnimation()
                        self?.image = downloadedImage
                        self?.imageCache.setObject(downloadedImage, forKey: imageURL as AnyObject)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self?.stopLoadingAnimation()
                    self?.image = UIImage(named: placeholderImage)
                }
            }
        }
    }
}


extension LazyImageView {
    
    func addGradientLayer() -> CAGradientLayer {
        
        gradientLayer.frame = self.frame
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [gradientColorOne, gradientColorTwo, gradientColorOne]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        self.layer.addSublayer(gradientLayer)
        
        return gradientLayer
    }
    
    func addAnimation() -> CABasicAnimation {
       
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.repeatCount = .infinity
        animation.duration = 0.9
        return animation
    }
    
    func startLoadingAnimation() {
        
        let gradientLayer = addGradientLayer()
        let animation = addAnimation()
       
        gradientLayer.add(animation, forKey: animation.keyPath)
    }
    
    func stopLoadingAnimation() {
        gradientLayer.removeFromSuperlayer()
    }
}
