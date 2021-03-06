//
//  FilterViewController.swift
//  NearByVenues
//
//  Created by Chaudhari, Dipak Bharat (external - Project) on 17/07/22.
//

import UIKit

protocol FilterViewControllerDelegate {
    func filterValueChanged(radius:Int)
}

class FilterViewController: UIViewController {

    @IBOutlet var slider:UISlider!
    @IBOutlet var currentValueLabel:UILabel!
    
    var delegate:FilterViewControllerDelegate!
    var sliderCurrentValue:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBar()
        self.setFilter()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.tintColor = .white
        self.title = "Filter"
        
        let applySettingButtonItem = UIBarButtonItem(title: "Apply", style: .plain, target: self, action: #selector(applyFilterSettings))
        navigationItem.rightBarButtonItem = applySettingButtonItem

    }
        
    @objc func applyFilterSettings() {
        self.delegate.filterValueChanged(radius: Int(slider.value))
        self.navigationController?.popViewController(animated: true)
    }
    
    func setFilter() {
        self.slider.minimumValue = 1000
        self.slider.maximumValue = 100000
        
        let radius = sliderCurrentValue ?? Constants.kDefaultRadius
        self.slider.value = Float(radius)
        self.currentValueLabel.text = "\(radius)"
        
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        currentValueLabel.text = "\(currentValue)"
    }
    
}
