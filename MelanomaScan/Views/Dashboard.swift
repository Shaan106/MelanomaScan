//
//  Dashboard.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 14/10/21.
//

import SwiftUI

struct Dashboard: View {
    
    var colors: [Color] = [Color("Background"), Color("Anti-Background")]
    @State var index: Int = 0
    
    @Environment(\.colorScheme) var colorScheme
    @State var scanImage = GifImage("Light_Mode_Cropped")
    
    var body: some View {
        
        // a navigation view allows for links to other pages
        NavigationView {
            
            ZStack {
                Rectangle()
                    .fill(Color("Background"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {

                    
                    NavigationLink(destination: SkinClassifier()) {
                        VStack {
                            if colorScheme == .dark {
                                GifImage("Dark_Mode_Cropped")
                            } else {
                                GifImage("Light_Mode_Cropped")
                            }
                        }
                    }.frame(width: 225, height: 225)
                        .background(Color.clear)
                    
                    if colorScheme == .dark {
                        Text("Scan")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .opacity(1)
                    } else {
                        Text("Scan")
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                            .opacity(1)
                    }
                    

                    VStack {

                        HStack {
                            Image(systemName: "cloud.sun")
                                .font(Font.system(.largeTitle))
                                .foregroundColor(Color("Anti-Background"))
                            NavigationLink("Weather Risks", destination: WeatherRisks())
                                .buttonStyle(NeumorphicButtonStyle(color: Color("Background")))
                        }.padding()

                        HStack {
                            Image(systemName: "person")
                                .font(Font.system(.largeTitle))
                                .foregroundColor(Color("Anti-Background"))
                            NavigationLink("Risk Factors", destination: InformationPage(coreDataManager: CoreDataManager()))
                                .buttonStyle(NeumorphicButtonStyle(color: Color("Background")))
                        }.padding()

                        HStack {
                            Image(systemName: "calendar")
                                .font(Font.system(.largeTitle))
                                .foregroundColor(Color("Anti-Background"))
                            NavigationLink("Reminders", destination: Reminders())
                                .buttonStyle(NeumorphicButtonStyle(color: Color("Background")))
                        }.padding()
                        
//                        SplashView(animationType: .circle, color: self.colors[self.index])
//                            .frame(width: 100, height: 100, alignment: .center)
//                            .cornerRadius(10)
//
//                        Button(action: {
//                                        self.index = (self.index + 1) % self.colors.count
//                                    }) {
//                                        Text("Change Color")
//                                    }
//                                    .padding(.top, 20)
//
                    }
                    
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
