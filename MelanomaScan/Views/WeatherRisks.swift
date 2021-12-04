//
//  WeatherRisks.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 14/10/21.
//

import SwiftUI

struct WeatherRisks: View {
    
    let uvIndexManager = UVIndexManager()
    
    var body: some View {
        
        VStack {
            
            Button("Test Request") {
                uvIndexManager.testRequest(callback: {(uvResponse: Double, uvMaxResponse: Double, ozoneResponse: Double) -> () in
                    print("UV Index: " + String(uvResponse))
                    print("Max UV Index: " + String(uvMaxResponse))
                    print("Ozone levels: " + String(ozoneResponse))
                } )
            }
            
        }
        .navigationBarTitle("Weather Risks")
    }
}

struct WeatherRisks_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRisks()
    }
}
