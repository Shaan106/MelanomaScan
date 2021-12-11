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
    let weatherRisksViewModel = WeatherRisksViewModel()
    let dateFormattingModel = DateFormattingModel()
    
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
    @State var solarNoonDisplay = "not fetched yet."
    
    @State var AQICity = "Current city not fetched yet."
    @State var AQIData = "AQI not fetched yet."
    @State var dateDisplay = Date()
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                
                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                    .frame(width: 350, height: 300)
                
                
                VStack {
                    
                    
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Text("City:")
                                .font(.title3)
                                .bold()
                            Text("\(AQICity)")
                                .font(.title3)
                                .opacity(0.8)
                        }
                        
                        HStack {
                            Text("Current AQI:")
                                .font(.title3)
                                .bold()
                            Text("\(AQIData)")
                                .font(.title3)
                                .opacity(0.8)
                        }
                        
                    }.padding()
                    
                    weatherRisksViewModel.getAQIColourCodedRectangles(aqi: Double(AQIData) ?? -1)
                    
                    //uncommment to test for different AQI values
                    //weatherRisksViewModel.getAQIColourCodedRectangles(aqi: 260)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Current UV Index:")
                                .font(.title3)
                                .bold()
                            Text("\(uvIndexDisplay)")
                                .font(.title3)
                                .opacity(0.8)
                        }
                        
                        HStack {
                            Text("Daily Max UV Index:")
                                .font(.title3)
                                .bold()
                            Text("\(uvMaxIndexDisplay)")
                                .font(.title3)
                                .opacity(0.8)
                        }
                    }.padding()
                    
                    weatherRisksViewModel.getUVColourCodedRectangles(uv: Double(uvIndexDisplay) ?? -1)
                    
                    VStack {
                        HStack {
                            Text("Daily Max UV Index:")
                                .font(.title3)
                                .bold()
                            Text("\(uvMaxIndexDisplay)")
                                .font(.title3)
                                .opacity(0.8)
                            weatherRisksViewModel.getMaxUVColourCodedRectangles(maxUV: Double(uvMaxIndexDisplay) ?? -1)
                        }
                        
                        HStack {
                            Text("Solar Noon (24hr format):")
                                .font(.title3)
                                .bold()
                            //Text(solarNoonDisplay, style: .time)
                            Text(dateFormattingModel.convertFromISO6801ToDate(inputISODate: solarNoonDisplay), style: .time)
                                .font(.title3)
                                .opacity(0.8)
                        }
                        
                    }.padding()
                    
                    
                    //uncomment to test for different UV values
                    //weatherRisksViewModel.getUVColourCodedRectangles(uv: 3)
                    
                }
                Spacer()
                
            }
            .navigationBarTitle("Weather Risks")
            .onAppear(perform: {
                uvIndexManager.requestUVInfoForLocation(inputLatitude: Double(userLatitude) ?? 0, inputLongitude: Double(userLongitude) ?? 0 ,callback: {(uvResponse: Double, uvMaxResponse: Double, ozoneResponse: Double, solarNoonResponse: String) -> () in
                    uvIndexDisplay = String(uvResponse)
                    uvMaxIndexDisplay = String(uvMaxResponse)
                    ozoneLevelDisplay = String(ozoneResponse)
                    solarNoonDisplay = String(solarNoonResponse)
                    print(solarNoonDisplay)
                })
                
                aqiManager.requestAQIInfoForLocation(inputLatitude: Double(userLatitude) ?? 0, inputLongitude: Double(userLongitude) ?? 0, callback: {(cityResponse: String, aqiResponse: Int) -> () in
                    AQICity = String(cityResponse)
                    AQIData = String(aqiResponse)
                })
                
            })
        }
    }
}

struct WeatherRisks_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRisks()
    }
}
