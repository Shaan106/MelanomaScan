//
//  CoreDataModel.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 12/11/21.
//

import Foundation

class RiskFactorsModel {
    
    func resetRiskFactors(coreDataManager: CoreDataManager, listOfRiskFactors: [String]) {
        
        coreDataManager.deleteAllRiskFactors()
        
        for item in listOfRiskFactors {
            coreDataManager.saveRiskFactorValue(stringValue: item)
        }
        
    }
    
    //["Age", "Gender", "Skin Type", "Eye Colour", "Hair Colour", "Number of Moles", "Freckles", "Family History", "Diseases and Conditions", "Body Mass Index"]
    
    func returnStringListOfRiskFactors(name: String) -> [String] {
        
        if name == "Age"{
            
            var output: [String] = []
            for i in 0...130 {
                output.append(String(i))
            }
            return output
            
        } else if name == "Gender" {
            
            return ["Male", "Female", "Other"]
            
        } else if name == "Skin Type" {
            
            return ["Type 1", "Type 2", "Type 3", "Type 4", "Type 5", "Type 6"]
            
        } else {
            
            return ["not configured"]
            
        }

    }
    
}
