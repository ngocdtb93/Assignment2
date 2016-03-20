//
//  DetailViewController.swift
//  Yelp
//
//  Created by Ngoc Do on 3/20/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    @IBAction func btnBack(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var myMap: MKMapView!
    
    @IBOutlet weak var lblName: UILabel!

    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblCategories: UILabel!
    @IBOutlet weak var lblVoted: UILabel!
    @IBOutlet weak var imageRated: UIImageView!
    
    var business:Business!
    var coord:CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.showLoading()
        fillData()
        fillMapView()
        self.view.hideLoading()
        // Do any additional setup after loading the view.
    }

    func fillData(){
        
        lblName.text = business.name
        //lblDistance.text = business.distance
        lblVoted.text = "\(business.reviewCount!) Reviews"
        lblAddress.text = "Address: \(business.address!)"
        lblCategories.text = "Categories: \(business.categories!)"
        lblPhone.text = "Call: \(business.phone!)"
        imageRated.setImageWithURL(business.ratingImageURL!)
    }
    func fillMapView(){
        self
        let location = business.address
        let geocoder:CLGeocoder = CLGeocoder();
        geocoder.geocodeAddressString(location!) { (placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            if placemarks?.count > 0 {
                
                let topResult:CLPlacemark = placemarks![0];
                let placemark: MKPlacemark = MKPlacemark(placemark: topResult);
                
                var region: MKCoordinateRegion = self.myMap.region;
                region.center = (placemark.location?.coordinate)!;
                region.span.longitudeDelta /= 1000;
                region.span.latitudeDelta /= 1000;
                self.myMap.setRegion(region, animated: true);
                self.myMap.addAnnotation(placemark);
                
            }
        }
    }

}
