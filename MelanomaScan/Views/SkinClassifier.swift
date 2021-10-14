//
//  ContentView.swift
//  MelanomaScan
//
//  Created by Yadav, Aasmaan (SPH) on 18/09/2021.
//

import SwiftUI

struct SkinClassifier: View {
    
    //display variables to do with the output of image classification
    @State private var currentImageName = "testImageMalignant1"
    @State private var classificationLabel: String = ""
    @State private var confidence: Double = 0
    
    @State private var imageChosen: Double = 1
    
    //creates instance of imageClassifier class
    let imageClassifierInstance = imageClassifier()
        
    var body: some View {
        
        VStack {
            
            //displaying chosen image, as well as information about classification of that image
            Image(currentImageName)
                .resizable()
//                .frame(width:UIScreen.main.bounds.width*(3/4), height:UIScreen.main.bounds.height*(1/4))
                .frame(width:200,height:200)
            
            //button to call subroutine to classify image
            Button("Classify") {
                (self.classificationLabel, self.confidence) = imageClassifierInstance.performImageClassification(imageName: currentImageName)
            }
            
            Text(classificationLabel)
                .padding()
                .font(.largeTitle)
            
            Text(String(confidence))
                .padding()
                .font(.largeTitle)
            
            NavigationLink("To Camera (choose new img)", destination: Camera())
                .padding()
            
            NavigationLink("To Information Page (change risk profile)", destination: InformationPage())
                .padding()
        }
    }
    
}

struct SkinClassifier_Previews: PreviewProvider {
    static var previews: some View {
        SkinClassifier()
    }
}
