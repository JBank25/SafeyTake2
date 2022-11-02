//
//  WorldView.swift
//  Trekr
//
//  Created by Joshua Urbank on 10/16/22.
//

import MapKit
import SwiftUI
import CoreLocationUI

struct WorldView: View {
    
    @StateObject private var worldViewModel = WorldViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom)
        {
            Map(coordinateRegion: $worldViewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
            
            LocationButton(.shareCurrentLocation){
                worldViewModel.requestAllowLocationPermission()
            }
            .foregroundColor(.white)
            .cornerRadius(8)
            .labelStyle(.titleAndIcon)
            .symbolVariant(.fill)
            .padding(.bottom, 50)
            
        }
    }
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView()
    }
}

final class WorldViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 30 , longitude: 30), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    let locationManager = CLLocationManager()

    override init(){
        super.init()
        locationManager.delegate = self
    }
    
    func requestAllowLocationPermission(){
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        twillTester()
        guard let latestLocation = locations.first else {
            return
        }
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
