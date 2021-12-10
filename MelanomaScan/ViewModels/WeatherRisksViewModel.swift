//
//  WeatherRisksViewModel.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 10/12/21.
//

import Foundation
import SwiftUI


class WeatherRisksViewModel {
    
    //source - https://www.openuv.io/uvindex
    
    @ViewBuilder func getUVColourCodedRectangles(uv: Double) -> some View {
        
        if uv == -1 {
            
            HStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.green)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.yellow)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.orange)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.red)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.purple)
            }.frame(width: UIScreen.screenWidth - 20, height: 20)
            
        } else if uv < 3 {
            
            HStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.green)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.yellow)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.orange)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.red)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.purple)
                    .opacity(0.5)
            }.frame(width: UIScreen.screenWidth - 20, height: 20)
            
        } else if uv < 6 {
            
            HStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.green)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.yellow)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.orange)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.red)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.purple)
                    .opacity(0.5)
            }.frame(width: UIScreen.screenWidth - 20, height: 20)
            
        } else if uv < 8 {
            
            HStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.green)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.yellow)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.orange)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.red)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.purple)
                    .opacity(0.5)
            }.frame(width: UIScreen.screenWidth - 20, height: 20)
            
        } else if uv < 11 {
            
            HStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.green)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.yellow)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.orange)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.red)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.purple)
                    .opacity(0.5)
            }.frame(width: UIScreen.screenWidth - 20, height: 20)
            
        } else if uv >= 11 {
            
            HStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.green)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.yellow)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.orange)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.red)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.purple)
            }.frame(width: UIScreen.screenWidth - 20, height: 20)
            
        }
        
    }
    
    //source - https://www.airnow.gov/aqi/aqi-basics/
    
    @ViewBuilder func getAQIColourCodedRectangles(aqi: Double) -> some View {
        
        if aqi == -1 {
            
            HStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.green)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.yellow)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.orange)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.red)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.purple)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.init(red: 0.5, green: 0, blue: 0))
            }.frame(width: UIScreen.screenWidth - 20, height: 20)
            
        } else if aqi <= 50 {
            
            HStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.green)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.yellow)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.orange)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.red)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.purple)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.init(red: 0.5, green: 0, blue: 0))
                    .opacity(0.5)
            }.frame(width: UIScreen.screenWidth - 20, height: 20)
            
        } else if aqi <= 100 {
            
            HStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.green)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.yellow)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.orange)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.red)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.purple)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.init(red: 0.5, green: 0, blue: 0))
                    .opacity(0.5)
            }.frame(width: UIScreen.screenWidth - 20, height: 20)
            
        } else if aqi <= 150 {
            
            HStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.green)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.yellow)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.orange)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.red)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.purple)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.init(red: 0.5, green: 0, blue: 0))
                    .opacity(0.5)
            }.frame(width: UIScreen.screenWidth - 20, height: 20)
            
        } else if aqi <= 200 {
            
            HStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.green)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.yellow)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.orange)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.red)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.purple)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.init(red: 0.5, green: 0, blue: 0))
                    .opacity(0.5)
            }.frame(width: UIScreen.screenWidth - 20, height: 20)
            
        } else if aqi <= 300 {
            
            HStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.green)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.yellow)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.orange)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.red)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.purple)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.init(red: 0.5, green: 0, blue: 0))
                    .opacity(0.5)
            }.frame(width: UIScreen.screenWidth - 20, height: 20)
            
        } else if aqi > 300 {
            
            HStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.green)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.yellow)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.orange)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.red)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.purple)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.init(red: 0.5, green: 0, blue: 0))
            }.frame(width: UIScreen.screenWidth - 20, height: 20)
            
        }
        
    }
    
    //source - https://www.openuv.io/uvindex
    
    @ViewBuilder func getMaxUVColourCodedRectangles(maxUV: Double) -> some View {
        
        if maxUV == -1 {
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .frame(width: UIScreen.screenWidth/6, height: 20)
            
        } else if maxUV < 3 {
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.green)
                .frame(width: UIScreen.screenWidth/6, height: 20)
            
        } else if maxUV < 6 {
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.yellow)
                .frame(width: UIScreen.screenWidth/6, height: 20)
            
        } else if maxUV < 8 {
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.orange)
                .frame(width: UIScreen.screenWidth/6, height: 20)
            
        } else if maxUV < 11 {
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.red)
                .frame(width: UIScreen.screenWidth/6, height: 20)
            
        } else if maxUV >= 11 {
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.purple)
                .frame(width: UIScreen.screenWidth/6, height: 20)
            
        }
        
    }
    
}


