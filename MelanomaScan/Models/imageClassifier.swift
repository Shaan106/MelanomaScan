//
//  imageClassifier.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 07/10/21.
//

import Foundation
import SwiftUI

class imageClassifier {
    
    //creating an instance of the trained melanoma model.
    let model = melanomaModel1_91_()
    
    //performs classification on the image specified, returning the output classification as well as the certainty of the classification.
    func performImageClassification(imageName: String) -> (String, Double) {
        
        guard let img = UIImage(named: imageName),
              let resizedImage = img.resizeTo(size: CGSize(width:750, height:750)),
              let buffer = resizedImage.toBuffer() else {
            return ("error1", 101.1)
        }
        
        let outputOptional = try? model.prediction(image: buffer)
        
        if let output = outputOptional {
            
            if let malignantProbability = output.classLabelProbs["Malignant"] {
                let roundedProbability = round(malignantProbability * 100) / 100.0
                return (output.classLabel, roundedProbability)
            }
            return (output.classLabel, 101.3)
        }
        
        return ("error2", 101.2)
    }
    
    func certaintyFunction() {
        //function to take in pure probability of prediction and return a certainty (ie measure from 50% rather than from 0%
    }
    
}
