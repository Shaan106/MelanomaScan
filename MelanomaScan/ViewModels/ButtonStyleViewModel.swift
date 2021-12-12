//
//  ButtonStyleViewModel.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 10/12/21.
//

import Foundation
import SwiftUI


struct NeumorphicButtonStyle: ButtonStyle {
    var color: Color
    
    //creates a button that has slight shadows and looks nice
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            //.padding()
            //.background(RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color("Background")).frame(width: UIScreen.screenWidth - 40, height: UIScreen.screenHeight/15).shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8).shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8) )
            //.frame(width: UIScreen.screenWidth/1.11, height: UIScreen.screenHeight/15)
            .frame(width: UIScreen.screenWidth/3, height: UIScreen.screenHeight/50)
            .padding(.horizontal, (UIScreen.screenWidth/4))
            .padding(.vertical, (UIScreen.screenHeight/40))
            //.padding(10)
            .background(Color("Background"))
            .cornerRadius(20)
            .shadow(color: Color("DarkShadow"), radius: 20, x: 8, y: 8)
            .shadow(color: Color("LightShadow"), radius: 20, x: -8, y: -8)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
    
    // for reference -
    //.background(RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color("Background")).frame(width: UIScreen.screenWidth - 40, height: UIScreen.screenHeight/15).shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8).shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8) )
    
//    Button("Test Button22222"){
//    }.frame(width: UIScreen.screenWidth - 40, height: UIScreen.screenHeight/15)
//        .buttonStyle(NeumorphicButtonStyle(color: Color("Background")))
//        .padding()
}
