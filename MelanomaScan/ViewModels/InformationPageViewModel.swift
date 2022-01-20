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
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .frame(width: UIScreen.screenWidth/6, height: 20)
            
        } else if riskFactorVal < 3 {
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.green)
                .frame(width: UIScreen.screenWidth/6, height: 20)
            
        } else if riskFactorVal < 6 {
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.yellow)
                .frame(width: UIScreen.screenWidth/6, height: 20)
            
        } else if riskFactorVal < 8 {
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.orange)
                .frame(width: UIScreen.screenWidth/6, height: 20)
            
        } else if riskFactorVal < 11 {
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.red)
                .frame(width: UIScreen.screenWidth/6, height: 20)
            
        } else if riskFactorVal >= 11 {
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.purple)
                .frame(width: UIScreen.screenWidth/6, height: 20)
            
        }
        
    }
    
}
