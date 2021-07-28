//
//  MapViewController.swift
//  StateListsApp
//
//  Created by Alex Tran on 12/4/20.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var findNearbyTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    var myLocMgr = CLLocationManager()
    var myGeoCoder = CLGeocoder()
    var showPlacemark: CLPlacemark?
    let greyPlaceholderText = NSAttributedString(string: "Find Nearby Locations",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
    
    var StateName: String!
    var findAddress = ""
    
    override func viewDidLoad() {
        //UI Design
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        mapView.layer.cornerRadius = 12.0
        mapView.layer.borderWidth = 3.0
        
        findNearbyTextField.layer.backgroundColor = #colorLiteral(red: 0.078832753, green: 0.2248245478, blue: 0.2865442634, alpha: 1)
        findNearbyTextField.layer.cornerRadius = 4.0
        findNearbyTextField.textColor = UIColor.white
        findNearbyTextField.attributedPlaceholder = greyPlaceholderText
        
        searchButton.layer.cornerRadius = 4
        searchButton.backgroundColor = #colorLiteral(red: 0.03490576893, green: 0.1723082364, blue: 0.2608429193, alpha: 1)
        
        findAddress = StateName + " State Capitol"
        
        //For State Address that could not be found
        if StateName == "Georgia" {
            findAddress = "206 Washington St SW, Atlanta, GA 30334"
        } else if StateName == "Arizona" {
            findAddress = "1700 W Washington St, Phoenix, AZ 85007"
        } else if StateName ==  "Idaho" {
            findAddress = "700 W Jefferson St, Boise, ID 83702"
        }
        //Map Code
        myLocMgr.delegate = self
        myLocMgr.requestWhenInUseAuthorization()
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        myGeoCoder.geocodeAddressString(findAddress, completionHandler: {
            placemarks, error in
            
            if error != nil {
                print(error!)
                return
            }
            
            if placemarks != nil && placemarks!.count > 0 {
                let placemark = placemarks![0] as CLPlacemark
                self.showPlacemark = placemark
                
                let annotation = MKPointAnnotation()
                annotation.title = placemark.name
                annotation.coordinate = placemark.location!.coordinate
                self.mapView.addAnnotation(annotation)
                self.mapView.showAnnotations([annotation], animated: true)
            }
        })
        
    }
    
    @IBAction func onSearchClick(_ sender: Any) {
        let mySearchReq = MKLocalSearch.Request()
        mySearchReq.naturalLanguageQuery = self.findNearbyTextField.text!
        mySearchReq.region = self.mapView.region
        
        let localSearch = MKLocalSearch(request: mySearchReq)
        localSearch.start(completionHandler: {
            searchResponse, searchError in
            
            if searchError != nil {
                print(searchError!)
                return
            }
            
            let myMapItems = searchResponse!.mapItems as [MKMapItem]
            var annotations : [MKAnnotation] = []
            if myMapItems.count > 0 {
                for item in myMapItems {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = (item.placemark.location?.coordinate)!
                    annotation.title = item.name
                    annotations.append(annotation)
                }
            }
            self.mapView.showAnnotations(annotations, animated: true)
        })
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
