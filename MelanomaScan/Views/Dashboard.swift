//
//  Dashboard.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 14/10/21.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Dashboard")
                NavigationLink("HELLO", destination: SkinClassifier())
            }
        }
        
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
