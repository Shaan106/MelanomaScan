//
//  Dashboard.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 14/10/21.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        
        // a navigation view allows for links to other pages
        NavigationView {
            VStack {
                
                Text("Melanoma Detector")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Text("Dashboard")
                    .font(.title)
                    .padding()
                
                //links to other pages.
                NavigationLink("To Skin Classifier", destination: SkinClassifier())
                    .padding()
                
                NavigationLink("To Functional Image Storage", destination: FunctionalImageStorage())
                    .padding()
                
                NavigationLink("To Camera", destination: Camera())
                    .padding()
                
                NavigationLink("To Information Page", destination: InformationPage())
                    .padding()
                
                NavigationLink("To Reminders", destination: Reminders())
                    .padding()
                
                NavigationLink("To Weather Risks", destination: WeatherRisks())
                    .padding()
            }
        }
        
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
