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
    let aqiManager = AQIManager()
    
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
    
    @State var uvIndexDisplay = "not fetched yet."
    @State var uvMaxIndexDisplay = "not fetched yet."
    @State var ozoneLevelDisplay = "not fetched yet."
    
    @State var AQICity = "Current city not fetched yet."
    @State var AQIData = "AQI not fetched yet."
    
    var body: some View {
        
        VStack {
            
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                .frame(width: 350, height: 300)
            
            
            VStack {
                
                VStack {
                    Text("location status: \(locationManager.statusString)")
                    Text("latitude: \(userLatitude)")
                    Text("longitude: \(userLongitude)")
                }.padding()
                
                VStack {
                    Text("City: \(AQICity)")
                    Text("Current AQI: \(AQIData)")
                }.padding()
                
                VStack {
                    Text("UV Index: " + uvIndexDisplay)
                    Text("Max UV Index: " + uvMaxIndexDisplay)
                    Text("Ozone Level: " + ozoneLevelDisplay)
                }.padding()
                
                
            }
            Spacer()
            
        }
        .navigationBarTitle("Weather Risks")
        .onAppear(perform: {
            uvIndexManager.requestUVInfoForLocation(inputLatitude: Double(userLatitude) ?? 0, inputLongitude: Double(userLongitude) ?? 0 ,callback: {(uvResponse: Double, uvMaxResponse: Double, ozoneResponse: Double) -> () in
                uvIndexDisplay = String(uvResponse)
                uvMaxIndexDisplay = String(uvMaxResponse)
                ozoneLevelDisplay = String(ozoneResponse)
            })
            
            aqiManager.requestAQIInfoForLocation(inputLatitude: Double(userLatitude) ?? 0, inputLongitude: Double(userLongitude) ?? 0, callback: {(cityResponse: String, aqiResponse: Int) -> () in
                AQICity = String(cityResponse)
                AQIData = String(aqiResponse)
            })
            
        })
    }
}

struct WeatherRisks_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRisks()
    }
}
