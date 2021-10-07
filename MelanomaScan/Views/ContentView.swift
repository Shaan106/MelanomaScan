//
//  ContentView.swift
//  MelanomaScan
//
//  Created by Yadav, Aasmaan (SPH) on 18/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var testImage = Image("testImageBenign")
    @State private var classificationLabel: String = ""
    let testPhoto = "banana" //test, delete later
    
    let model = melanomaModel1_91_()
    
    private func performImageClassification() {
        let currentImageName = "testImageBenign"
        
        guard let img = UIImage(named: currentImageName),
              let resizedImage = img.resizeTo(size: CGSize(width:299, height:299)),
              let buffer = resizedImage.toBuffer() else {
            return
        }
        
        let outputOptional = try? model.prediction(image: buffer)
        
        if let output = outputOptional {
            
            self.classificationLabel = output.classLabel
            
        }
    }
    
    var body: some View {
        VStack {
            Image(testPhoto)
                .resizable()
                .frame(width:200, height:200)
            testImage
                .resizable()
                .frame(width:200, height:200)
                //.scaledToFit()
            Button("Classify") {
                self.performImageClassification()
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
