//
//  ContentView.swift
//  MelanomaScan
//
//  Created by Yadav, Aasmaan (SPH) on 18/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    //display variables to do with the output of image classification
    @State private var currentImageName = "testImageBenign2"
    @State private var classificationLabel: String = ""
    @State private var confidence: Double = 0
    let imageClassifierInstance = imageClassifier()
        
    var body: some View {
        VStack {
            //displaying chosen image, as well as information about classification of that image
            Image(currentImageName)
                .resizable()
//                .frame(width:UIScreen.main.bounds.width*(3/4), height:UIScreen.main.bounds.height*(1/4))
                .frame(width:200,height:200)

            Button("Classify") {
                (self.classificationLabel, self.confidence) = imageClassifierInstance.performImageClassification(imageName: currentImageName)
            }
            
            Text(classificationLabel)
                .padding()
                .font(.largeTitle)
            
            Text(String(confidence))
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
