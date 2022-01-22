//
//  InformationPageViewModel.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 16/01/22.
//

import Foundation
import SwiftUI

class InformationPageViewModel {
    
    @ViewBuilder func getRiskFactorColourCodedRectangles(riskFactorVal: Double) -> some View {
        
        if riskFactorVal == -1 {
            
            VStack {
                Text("n/a").padding()
                HStack {
                    Text("Risk: ").bold()
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(red: 0 / 255, green: 255 / 255, blue: 128 / 255)).opacity(0.5)
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(red: 192 / 255, green: 255 / 255, blue: 0 / 255)).opacity(0.5)
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(red: 245 / 255, green: 255 / 255, blue: 0 / 255)).opacity(0.5)
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.orange.opacity(0.5))
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                }
            }.padding(.bottom)
            
        } else if riskFactorVal <= 1.6 {
            
            VStack {
                Text("You should check your skin every 6 months").padding()
                HStack {
                    Text("Risk: ").bold()
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(red: 0 / 255, green: 255 / 255, blue: 128 / 255)).opacity(1)
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(red: 192 / 255, green: 255 / 255, blue: 0 / 255)).opacity(0.5)
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(red: 245 / 255, green: 255 / 255, blue: 0 / 255)).opacity(0.5)
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.orange.opacity(0.5))
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                }
            }.padding(.bottom)
            
        } else if riskFactorVal <= 2.5 {
            
            VStack {
                Text("You should check your skin every 3-6 months").padding()
                HStack {
                    Text("Risk: ").bold()
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(red: 0 / 255, green: 255 / 255, blue: 128 / 255)).opacity(0.5)
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(red: 192 / 255, green: 255 / 255, blue: 0 / 255)).opacity(1)
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(red: 245 / 255, green: 255 / 255, blue: 0 / 255)).opacity(0.5)
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.orange.opacity(0.5))
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                }
            }.padding(.bottom)
            
        } else if riskFactorVal <= 5 {
            
            VStack {
                Text("You should check your skin every 2-3 months").padding()
                HStack {
                    Text("Risk: ").bold()
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(red: 0 / 255, green: 255 / 255, blue: 128 / 255)).opacity(0.5)
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(red: 192 / 255, green: 255 / 255, blue: 0 / 255)).opacity(0.5)
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(red: 245 / 255, green: 255 / 255, blue: 0 / 255)).opacity(1)
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.orange.opacity(0.5))
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                }
            }.padding(.bottom)
            
        } else if riskFactorVal > 5 {
            
            VStack {
                Text("You should check with a GP about the information you entered").padding()
                HStack {
                    Text("Risk: ").bold()
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(red: 0 / 255, green: 255 / 255, blue: 128 / 255)).opacity(0.5)
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(red: 192 / 255, green: 255 / 255, blue: 0 / 255)).opacity(0.5)
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(red: 245 / 255, green: 255 / 255, blue: 0 / 255)).opacity(0.5)
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.orange.opacity(1))
                        .frame(width: UIScreen.screenWidth/6, height: 20)
                }
            }.padding(.bottom)
            
        }
        
    }
    
}
