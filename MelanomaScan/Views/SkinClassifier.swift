//
//  ContentView.swift
//  MelanomaScan
//
//  Created by Yadav, Aasmaan (SPH) on 18/09/2021.
//

import SwiftUI

struct SkinClassifier: View {
    
    //display variables to do with the output of image classification
    private var listOfImages = ["testImageMalignant1","testImageMalignant2","testImageMalignant3","testImageBenign1","testImageBenign2","testImageBenign3"]
    @State private var currentImageName = "testImageMalignant1"
    @State private var classificationLabel: String = ""
    @State private var confidence: Double = 0
    
    @State private var imageChosen: Double = 1
    
    //picture picker
    @State var changeClassificationImage = false
    @State var openCameraRoll = false
    @State var imageSelectedFromCameraRoll = UIImage()
    
    //creates instance of imageClassifier class
    let imageClassifierInstance = imageClassifier()
        
    var body: some View {
        
        VStack {
            
            //picker to select image for classification
            Picker("", selection: $currentImageName) {
                            ForEach(listOfImages, id: \.self) {
                                Text($0)
                            }
                        }
            .padding()
            
            //displaying chosen image, as well as information about classification of that image
            Button(action: {
                changeClassificationImage = true
                openCameraRoll = true
                
            }, label: {
                if changeClassificationImage == true {
                    Image(uiImage: imageSelectedFromCameraRoll)
                        .resizable()
                        .frame(width: 250, height: 250)
                } else {
                    Image(currentImageName)
                        .resizable()
                        //.frame(width:UIScreen.main.bounds.width*(3/4), height:UIScreen.main.bounds.height*(1/4))
                        .frame(width:250,height:250)
                }
            })
            
            //button to call subroutine to classify image
            Button("Classify") {
                (self.classificationLabel, self.confidence) = imageClassifierInstance.performImageClassification(imageName: currentImageName)
            }
            
            //what the image is classified as
            Text(classificationLabel)
                .padding()
                .font(.title)
            
            //confidence of classification
            Text(String(confidence))
                .padding()
                .font(.title)
            
            NavigationLink("To Camera (choose new img)", destination: Camera())
            
            NavigationLink("To Information Page (change risk profile)", destination: InformationPage())
            
        }.sheet(isPresented: $openCameraRoll, content: {
            ImagePicker(selectedImage: $imageSelectedFromCameraRoll,sourceType: .photoLibrary)
        })
        
        .navigationBarTitle("Skin Classifier")
        
    }
    
}

struct SkinClassifier_Previews: PreviewProvider {
    static var previews: some View {
        SkinClassifier()
    }
}
