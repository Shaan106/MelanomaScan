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
                
                //links to other pages.
                NavigationLink("To Skin Classifier", destination: SkinClassifier())
                    .padding()
                
                NavigationLink("To Functional Image Storage", destination: FunctionalImageStorage())
                    .padding()
                
                NavigationLink("To Information Page", destination: InformationPage(coreDataManager: CoreDataManager()))
                    .padding()
                
                NavigationLink("To Reminders", destination: Reminders())
                    .padding()
                
                NavigationLink("To Weather Risks", destination: WeatherRisks())
                    .padding()
            }
            .navigationBarTitle("Melanoma Detector")
        }
        
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
