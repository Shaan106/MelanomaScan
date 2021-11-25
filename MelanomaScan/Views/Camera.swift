//
//  Camera.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 14/10/21.
//

import SwiftUI

struct Camera: View {
    
    @State var openCamera = false
    @State var shownImage = UIImage()
    @State var changeShownImage = false
    let initialImageName = "initialImage"
    
    var body: some View {
        
        VStack {
            Text("Camera page")
            .navigationBarTitle("Camera")
            
            Button(action: {
                changeShownImage = true
                openCamera = true
                
            }, label: {
                if changeShownImage == true {
                    Image(uiImage: shownImage)
                        .resizable()
                        .frame(width: 250, height: 250)
                } else {
                    Image(initialImageName)
                        .resizable()
                        .frame(width:250,height:250)
                }
            })
            
            
        }.sheet(isPresented: $openCamera, content: {
            ImagePicker(selectedImage: $shownImage, sourceType: .camera)
        })
    }
}

struct Camera_Previews: PreviewProvider {
    static var previews: some View {
        Camera()
    }
}
