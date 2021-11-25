//
//  ContentView.swift
//  MelanomaScan
//
//  Created by Yadav, Aasmaan (SPH) on 18/09/2021.
//

import SwiftUI

struct SkinClassifier: View {
    
    private var initialImageName = "initialImage"
    @State private var classificationLabel: String = ""
    @State private var confidence: Double = 0
    
    //states affecting look of view
    @State private var imageChosen: Double = 1
    @State private var showingClassificationWarning = false
    
    //picture picker
    @State var changeClassificationImage = false
    @State var openCameraRoll = false
    @State var openCamera = false
    @State var imageSelectedFromCameraRoll = UIImage()
    
    @State var sourceTypeChoice: UIImagePickerController.SourceType = .photoLibrary
    
    @State var showChooseCameraOrRollSheet = false
    
    //creates instance of imageClassifier class
    let imageClassifierInstance = ImageClassifier()
        
    var body: some View {
        
        VStack {
            
            //displaying chosen image, as well as information about classification of that image
            Button(action: {
                
                showChooseCameraOrRollSheet = true
                
            }, label: {
                if changeClassificationImage == true {
                    Image(uiImage: imageSelectedFromCameraRoll)
                        .resizable()
                        .frame(width: 250, height: 250)
                } else {
                    Image(initialImageName)
                        .resizable()
                        //.frame(width:UIScreen.main.bounds.width*(3/4), height:UIScreen.main.bounds.height*(1/4))
                        .frame(width:250,height:250)
                }
            }).actionSheet(isPresented: $showChooseCameraOrRollSheet) {
                ActionSheet(title: Text("Select Photo"),
                            message: Text("Choose"),
                            buttons: [
                                .default(Text("Photo Library")) {
                                    changeClassificationImage = true
                                    openCameraRoll = true
                                    sourceTypeChoice = .photoLibrary
                                },
                                .default(Text("Camera")) {
                                    changeClassificationImage = true
                                    openCameraRoll = true //make sure cameropen
                                    sourceTypeChoice = .camera
                                },
                                .cancel()
                            ])
            }
            
            //button to call subroutine to classify image
            Button("Classify") {
                showingClassificationWarning = true
                (self.classificationLabel, self.confidence) = imageClassifierInstance.performImageClassification2(image: imageSelectedFromCameraRoll)
                //converts confidence from 0-1 to 0-100, adding normalisation
                self.confidence = imageClassifierInstance.certaintyFunction(oldCertainty: self.confidence)
            }
            .alert( isPresented: $showingClassificationWarning) {
                Alert(
                    title: Text("[MESSAGE ABOUT ML ALGORITHM NOT BEING PERFECT]"),
                    message: Text("Message"),
                    dismissButton: .default(Text("I understand"), action: {
                    })
                )
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
            
        }.sheet(isPresented: $openCameraRoll, content: {
            ImagePicker(selectedImage: $imageSelectedFromCameraRoll, sourceType: sourceTypeChoice)
        })
        
        .navigationBarTitle("Skin Classifier")
        
    }
    
}

struct SkinClassifier_Previews: PreviewProvider {
    static var previews: some View {
        SkinClassifier()
    }
}
