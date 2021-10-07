//
//  imageClassifier.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 07/10/21.
//

import Foundation
import SwiftUI

class imageClassifier {
    
    let model = melanomaModel1_91_()
    
    func performImageClassification(imageName: String) -> String {
        
        guard let img = UIImage(named: imageName),
              let resizedImage = img.resizeTo(size: CGSize(width:299, height:299)),
              let buffer = resizedImage.toBuffer() else {
            return "error1"
        }
        
        let outputOptional = try? model.prediction(image: buffer)
        
        if let output = outputOptional {
            
            return output.classLabel
            
        }
        
        return "error2"
    }
    
}
