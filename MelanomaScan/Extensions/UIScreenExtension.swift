//
//  UIScreenExtension.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 10/12/21.
//

import Foundation
import SwiftUI

//extension to get screen width and height for whatever device

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
