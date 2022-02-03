//
//  ContentView.swift
//  MelanomaScan
//
//  Created by Yadav, Aasmaan (SPH) on 18/09/2021.
//

import SwiftUI

struct SkinClassifier: View {
    
    private var initialImageName = "initialImage"
    @State private var classificationLabel: String = "   n/a   "
    @State private var confidence: Double = 0
    
    //states affecting look of view
    @State private var imageChosen: Double = 1
    @State private var showingClassificationWarning = false
    @State private var linkToFurtherInformationShowing = false
    
    //picture picker
    @State var changeClassificationImage = false
    @State var openCameraRoll = false
    @State var openCamera = false
    @State var imageSelectedFromCameraRoll = UIImage()
    
    @State var sourceTypeChoice: UIImagePickerController.SourceType = .photoLibrary
    
    @State var showChooseCameraOrRollSheet = false
    
    //creates instance of imageClassifier class
    let imageClassifierInstance = ImageClassifier()
    let imageSaver = ImageSaver()
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            
            ZStack {
                VStack {
                    
                    //displaying chosen image, as well as information about classification of that image
                    Button(action: {
                        
                        showChooseCameraOrRollSheet = true
                        
                    }, label: {
                        if changeClassificationImage == true {
                            Image(uiImage: imageSelectedFromCameraRoll)
                                .resizable()
                                .cornerRadius(20)
                                .frame(width: 250, height: 250)
                        } else {
                            Image(systemName: "camera.viewfinder")
                                .resizable()
                                .cornerRadius(20)
                                .foregroundColor(Color("Anti-Background"))
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
                    Button("Classify Image") {
                        showingClassificationWarning = true
                        (self.classificationLabel, self.confidence) = imageClassifierInstance.performImageClassification2(image: imageSelectedFromCameraRoll)
                        //converts confidence from 0-1 to 0-100, adding normalisation
                        self.confidence = imageClassifierInstance.certaintyFunction(oldCertainty: self.confidence)
                        
                        if classificationLabel == "Malignant" {
                            linkToFurtherInformationShowing = true
                        } else {
                            linkToFurtherInformationShowing = false
                        }
                        
                    }.buttonStyle(NeumorphicButtonStyle(color: Color("Background")))
                        .alert( isPresented: $showingClassificationWarning) {
                            Alert(
                                title: Text("Important Note"),
                                message: Text("Please do not take the result of this app for granted. It is an algorithm that is not always correct and it will always be better to see a professional doctor if you have any concern."),
                                dismissButton: .default(Text("I understand"), action: {
                                })
                            )
                        }.padding()
                    
                    Button("Save Image") {
                        
                        if changeClassificationImage == true {
                            imageSaver.writeToPhotoAlbum(image: imageSelectedFromCameraRoll)
                        } else {
                            imageSaver.writeToPhotoAlbum(image: UIImage(imageLiteralResourceName: initialImageName))
                        }
                    }.buttonStyle(NeumorphicButtonStyle(color: Color("Background")))
                    
                    //what the image is classified as
                    Text(classificationLabel)
                        .bold()
                        .foregroundColor(Color("Background"))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color("Anti-Background")))
                        .padding()
                        .font(.title)
                    
                    //confidence of classification
                    Text("Classifier Confidence: " + String( round(confidence*10)/10.0 ) + "%")
                        .padding()
                        .font(.title3)
                    
                }.sheet(isPresented: $openCameraRoll, content: {
                    ZStack {
                        
                        
                        
                        if sourceTypeChoice != .photoLibrary {
                            
                            ImagePicker(selectedImage: $imageSelectedFromCameraRoll, sourceType: sourceTypeChoice)
                            
                            Arc(startAngle: .degrees(0), endAngle: .degrees(360), clockwise: true)
                                .stroke(.blue, lineWidth: 3)
                                .frame(width: 125, height: 125)
                            
                        } else {
                            ImagePicker(selectedImage: $imageSelectedFromCameraRoll, sourceType: sourceTypeChoice)
                        }
                        
                    }
                })
                
                    .alert( isPresented: $linkToFurtherInformationShowing) {
                        Alert(
                            title: Text("Important Note"),
                            message: Text("Remember the classification provided by this app is just a naive prediction. Please research it more through the following link"),
                            primaryButton: .default(Text("Link")) {
                                if let url = URL(string: "https://www.nhs.uk/conditions/melanoma-skin-cancer/") {
                                       UIApplication.shared.open(url)
                                    }
                            },
                            secondaryButton: .cancel()
                        )
                    }
                
            }
            .navigationBarTitle("Skin Classifier")
        }
    }
    
}

struct SkinClassifier_Previews: PreviewProvider {
    static var previews: some View {
        SkinClassifier()
    }
}
