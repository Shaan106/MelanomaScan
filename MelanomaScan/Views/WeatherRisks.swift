//
//  WeatherRisks.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 14/10/21.
//

import SwiftUI
import MapKit

struct WeatherRisks: View {
    
    let uvIndexManager = UVIndexManager()
    
    @StateObject var locationManager = LocationManager()
    
    //setting the user's co-ordinates
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    //using apple's Mapkit to create an initial region, completely random
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1, longitude: 1), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        
        VStack {
            
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                        .frame(width: 400, height: 300)
            
            Spacer()
            
            VStack {
                
                Text("location status: \(locationManager.statusString)")
                Text("latitude: \(userLatitude)")
                Text("longitude: \(userLongitude)")
                
                Button("Test Request") {
                    uvIndexManager.testRequest(callback: {(uvResponse: Double, uvMaxResponse: Double, ozoneResponse: Double) -> () in
                        print("UV Index: " + String(uvResponse))
                        print("Max UV Index: " + String(uvMaxResponse))
                        print("Ozone levels: " + String(ozoneResponse))
                    } )
                }
            }
            Spacer()
            
        }
        .navigationBarTitle("Weather Risks")
    }
}

struct WeatherRisks_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRisks()
    }
}
