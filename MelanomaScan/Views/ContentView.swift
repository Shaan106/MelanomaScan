//
//  ContentView.swift
//  MelanomaScan
//
//  Created by Yadav, Aasmaan (SPH) on 18/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var testImage = Image("testImageBenign")
    @State private var testImageOutput = ""
    
    var body: some View {
        VStack {
            testImage
                .resizable()
                .scaledToFit()
            Button(action: calculateMelanoma) {
                Text("Calculate")
            }
        }
    }
    
    func calculateMelanoma() {
        let model = melanomaModel1_91_()
        
        do {
            //let prediction = try model.prediction(image: testImage)
            //print(prediction)
        } catch {
            testImageOutput = "Error"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
