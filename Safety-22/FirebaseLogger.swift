//
//  FirebaseLogger.swift
//  Safety-22
//
//  Created by Amal Babu on 11/12/22.
//

import Foundation
import FirebaseDatabase
import MapKit



func logLocation(_coord: CLLocationCoordinate2D){
    var path = Database.database().reference().child("test");
    var data = ["latitude":  _coord.latitude, "longitude" : _coord.longitude];
    path.childByAutoId().setValue(data);
}
