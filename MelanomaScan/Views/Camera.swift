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
    
    var body: some View {
        
        VStack {
            Text("Camera page")
            .navigationBarTitle("Camera")
            
            Button("Open Camera") {
                openCamera = true
            }
            
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
