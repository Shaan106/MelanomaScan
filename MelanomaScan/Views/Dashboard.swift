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
            
            ZStack {
                Rectangle()
                    .fill(Color("Background"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    //links to other pages.
                    
                    NavigationLink("Skin Classifier", destination: SkinClassifier())
                        .padding()
                        .buttonStyle(NeumorphicButtonStyle(color: Color("Background")))
                    
                    NavigationLink("[remove]", destination: FunctionalImageStorage())
                        .padding()
                        .buttonStyle(NeumorphicButtonStyle(color: Color("Background")))
                    
                    NavigationLink("Risk Factors", destination: InformationPage(coreDataManager: CoreDataManager()))
                        .padding()
                        .buttonStyle(NeumorphicButtonStyle(color: Color("Background")))
                    
                    NavigationLink("Reminders", destination: Reminders())
                        .padding()
                        .buttonStyle(NeumorphicButtonStyle(color: Color("Background")))
                    
                    NavigationLink("Weather Risks", destination: WeatherRisks())
                        .padding()
                        .buttonStyle(NeumorphicButtonStyle(color: Color("Background")))
                }
                .navigationBarTitle("Melanoma Detector")
            }
        }
        
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
