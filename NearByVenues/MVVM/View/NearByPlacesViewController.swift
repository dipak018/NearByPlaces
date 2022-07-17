//
//  NearByPlacesViewController.swift
//  NearByVenues
//
//  Created by Chaudhari, Dipak Bharat (external - Project) on 12/07/22.
//

import UIKit
import CoreLocation

class NearByPlacesViewController: UITableViewController {

    var userLocation:CLLocation?
    var locationManager: CLLocationManager?

    var nearByPlacesViewModel:NearByPlacesViewModel = NearByPlacesViewModel()
    var places:[Place] = []
    var filterRadius:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Near By Places"
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:  #selector(startUpdatingLocation), for: .valueChanged)
        self.refreshControl = refreshControl
        
        self.setLocationManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)    
    }
    
    func setLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    @objc func startUpdatingLocation() {
        locationManager?.startUpdatingLocation()
    }
    
    func getNearByPlaces() {
        SwiftLoader.show(animated: true)
        
        if let userCoordinate = self.userLocation?.coordinate {
            
            let userLatLong = "\(userCoordinate.latitude),\(userCoordinate.longitude)"
            let radius = filterRadius ?? Constants.kDefaultRadius
            
            // Fetching near by places
            nearByPlacesViewModel.fetchNearByPlaces(locationString: userLatLong, radius: radius) { _places in
                if let placeArray = _places?.results {
                    self.places = placeArray
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        SwiftLoader.hide()
                    }
                }
            }
        } else {
            debugPrint("Show alert")
        }

    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kPlaceTableCellID, for: indexPath) as! PlaceTableViewCell

        let place = self.places[indexPath.row]
        // Setup Cell Data
        cell.setCellData(_place: place)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: Constants.kPlaceDetailsSegueID, sender: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.kPlaceDetailsSegueID {
            if let controller = segue.destination as? PlaceDetailViewController {
                
                if let indexPath = tableView.indexPathForSelectedRow {
                    controller.place = self.places[indexPath.row]
                }
            }
        } else if segue.identifier == Constants.kFilterViewControllerSegueID {
            let controller = segue.destination as? FilterViewController
            controller?.delegate = self
            controller?.sliderCurrentValue = filterRadius ?? Constants.kDefaultRadius
        }
    }
}

extension NearByPlacesViewController : FilterViewControllerDelegate {
    func filterValueChanged(radius: Int) {
        self.filterRadius = radius
        self.getNearByPlaces()
    }
}
