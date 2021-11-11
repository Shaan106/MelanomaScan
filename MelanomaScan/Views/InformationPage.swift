//
//  InformationPage.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 14/10/21.
//

import SwiftUI

struct InformationPage: View {
    
    @State private var riskFactorAge: String = "" //convert to Int16 later
    
    var body: some View {
        VStack {
            TextField("Enter age", text: $riskFactorAge)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Save") {

            }
        }.padding()
        .navigationBarTitle("Information Page")
    }
}

struct InformationPage_Previews: PreviewProvider {
    static var previews: some View {
        InformationPage()
    }
}
