//
//  FunctionalImageStorage.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 14/10/21.
//

import SwiftUI

struct FunctionalImageStorage: View {
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                GifImage("Dark_Mode_Cropped")
                    .frame(width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth - 40)
                    .background(Color.clear)
                
                Text("Functional Image Storage Page")
            }
            .navigationBarTitle("Functional Image Storage")
        }
    }
}

struct FunctionalImageStorage_Previews: PreviewProvider {
    static var previews: some View {
        FunctionalImageStorage()
    }
}
