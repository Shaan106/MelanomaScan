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
    
    let model = melanomaModel1_91_()
    
    var body: some View {
        VStack {
            Button("Classify") {
                
            }
//            testImage
//                .resizable()
//                .scaledToFit()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
