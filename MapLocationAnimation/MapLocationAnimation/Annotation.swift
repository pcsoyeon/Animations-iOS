//
//  Annotation.swift
//  MapLocationAnimation
//
//  Created by soyeon on 2021/06/20.
//

import Foundation
import MapKit

class Annotation: NSObject, MKAnnotation {
    
    // MARK: - Properties

    let coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    // MARK: - Initializers
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }

}
