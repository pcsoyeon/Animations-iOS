//
//  ViewController.swift
//  MapLocationAnimation
//
//  Created by soyeon on 2021/06/20.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    // MARK: - Types
    
    struct Constants {
        struct MapViewIdentifiers {
            static let sonarAnnotationView = "sonarAnnotationView"
        }
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
    }
    
    let regionRadius: CLLocationDistance = 3000
    let latitude = 40.758873
    let longitude = -73.985134
    
    // MARK: - View Life Cycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Set initial location for map view.
        let initialLocation = CLLocation(latitude: latitude, longitude: longitude)
        centerMapOnLocation(initialLocation)
        
        // Add annotation to map based on location.
        let annotation = Annotation(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), title: nil, subtitle: nil)
        mapView.addAnnotation(annotation)
    }
    
    // MARK: - Convenience
    
    func centerMapOnLocation(_ location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: false)
    }
    
    // MARK: - Status Bar
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
}

extension ViewController: MKMapViewDelegate {
    // MARK: - MKMapViewDelegate
     
     func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
         
         if annotation is MKUserLocation {
             return nil
         }
         
         // Reuse the annotation if possible.
         var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.MapViewIdentifiers.sonarAnnotationView)
         
         if annotationView == nil {
            annotationView = SonarAnnotationView(annotation: annotation, reuseIdentifier: Constants.MapViewIdentifiers.sonarAnnotationView)
         } else {
             annotationView!.annotation = annotation
         }
         
         return annotationView
     }
}
