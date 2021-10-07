//
//  ContentView.swift
//  MelanomaScan
//
//  Created by Yadav, Aasmaan (SPH) on 18/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentImageName = "testImageBenign"
    @State private var classificationLabel: String = ""
    let imageClassifierInstance = imageClassifier()
        
    var body: some View {
        VStack {
            Image(currentImageName)
                .resizable()
//                .frame(width:UIScreen.main.bounds.width*(3/4), height:UIScreen.main.bounds.height*(1/4))
                .frame(width:200,height:200)

            Button("Classify") {
                self.classificationLabel = imageClassifierInstance.performImageClassification(imageName: currentImageName)
            }
            
            Text(classificationLabel)
                .padding()
                .font(.largeTitle)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
