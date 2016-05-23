//
//  MapController.swift
//  BooksPrice
//
//  Created by DE DPU on 5/23/2559 BE.
//  Copyright © 2559 DE DPU. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class MapController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    //viewDidLoad
    override func viewDidLoad() {
    super.viewDidLoad()
    
    mapView.delegate = self
    
    let locations = [
    ["name" : "Comic Book Store",
    "latitude" : 13.797949,
    "longitude" : 100.549997,
    "Address" : "1639/60 Phahonyothin Rd, Khwaeng Samsen Nai, Khet Phaya Thai, Krung Thep Maha Nakhon 10400"],
    
    
    ["name" : "Samoe Chai Book Shop",
    "latitude" : 13.795765,
    "longitude" : 100.544693,
    "Address" : "Soi Mu Ban Phibun Watthana 2, Khwaeng Samsen Nai, Khet Phaya Thai, Krung Thep Maha Nakhon 10400"],
    
    
    ["name" : "Dokya Book Store",
    "latitude" : 13.838687,
    "longitude" : 100.574559,
    "Address" : "Krung Thep Maha Nakhon, จังหวัด กรุงเทพมหานคร 10900"],
    
    
    ["name" : "Ohayo",
    "latitude" : 13.816170,
    "longitude" : 100.561398,
    "Address" : "1692 (เซ็นทรัลลาดพร้าว ชั้นใต้ดิน) ถนนพหลโยธิน แขวงจตุจักร, Khwaeng Chatuchak, Khet Chatuchak, Krung Thep Maha Nakhon 10900"],
    
    
    ["name" : "yin-yang cartoon",
        "latitude" : 13.757257,
        "longitude" : 100.564742,
        "Address" : "ฟอร์จูนทาวน์ รัชดา ชั้นล่างโลตัส, ถนนรัชดาพิเศษ, เขตห้วยขวาง จังหวัดกรุงเทพมหานคร, 10310, Khwaeng Din Daeng, Khet Din Daeng, Krung Thep Maha Nakhon 10400"],
    
    
    ["name" : "JJ 50%",
        "latitude" : 13.793395,
        "longitude" : 100.549377,
        "Address" : "1541-1543 Thanon Phaholyothin, Samsen Nai, Phaya Thai, Bangkok 10400"],
    
    
    ["name" : "เมก้าการ์ตูน",
        "latitude" : 13.822344,
        "longitude" : 100.515658,
        "Address" : "200 อาคาร หอพักหญิงศิริสุข, Wong Sawang Rd, Khwaeng Wong Sawang, Khet Bang Sue, Krung Thep Maha Nakhon 10800"],
    
    
    ["name" : "Toonzone",
        "latitude" : 13.745534,
        "longitude" : 100.532988,
        "Address" : "สยามสแคว์ซอย7 พระราม1, Khwaeng Pathum Wan, Khet Pathum Wan, Krung Thep Maha Nakhon 10330"]
    
    
        
    ]
    
    
    var annotations = [MKPointAnnotation]()
    for dictionary in locations {
    let latitude = CLLocationDegrees(dictionary["latitude"] as! Double)
    let longitude = CLLocationDegrees(dictionary["longitude"] as! Double)
    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    let name = dictionary["name"] as! String
    let address = dictionary["Address"] as! String
    let annotation = MKPointAnnotation()
    annotation.coordinate = coordinate
    annotation.title = "\(name)"
    annotation.subtitle = address
    annotations.append(annotation)
    }
    mapView.addAnnotations(annotations)
    centerMapOnLocation(annotations[0], regionRadius: 1000000.0)
    
    //location
    /*self.locationManager.delegate = self
     self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
     self.locationManager.requestWhenInUseAuthorization()
     self.locationManager.startUpdatingLocation()
     self.mapView.showsUserLocation = true*/
    
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
    
    
    func centerMapOnLocation(location: MKPointAnnotation, regionRadius: Double) {
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
    regionRadius * 2.0, regionRadius * 2.0)
    mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
    let reuseIdentifier = "pin"
    var pin = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseIdentifier) as? MKPinAnnotationView
    if pin == nil {
    pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
    pin!.pinColor = .Red
    pin!.canShowCallout = true
    pin!.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure)
    } else {
    pin!.annotation = annotation
    }
    return pin
    }
    
    func mapView(mapView: MKMapView, annotationView: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
    if control == annotationView.rightCalloutAccessoryView {
    let app = UIApplication.sharedApplication()
    app.openURL(NSURL(string: (annotationView.annotation!.subtitle!)!)!)
    }
    }
    
    
    //MARK: Location Delegate Method
    
    /*func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
     
     let location = locations.last
     
     let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
     
     let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
     
     self.mapView.setRegion(region, animated: true)
     
     self.locationManager.stopUpdatingLocation()
     
     
     }
     
     func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
     print("Errors: " + error.localizedDescription)
     
     }*/
    
    }


