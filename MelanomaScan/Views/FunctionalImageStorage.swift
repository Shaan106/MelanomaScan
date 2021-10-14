//
//  FunctionalImageStorage.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 14/10/21.
//

import SwiftUI

struct FunctionalImageStorage: View {
    var body: some View {
        VStack {
            Text("Functional Image Storage Page")
            
            NavigationLink("To Camera", destination: Camera())
                .padding()
        }
        
    }
}

struct FunctionalImageStorage_Previews: PreviewProvider {
    static var previews: some View {
        FunctionalImageStorage()
    }
}
