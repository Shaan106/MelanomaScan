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
            
            return ["0-9", "10-19", "20-39", "40-69", "70-99", "100+"]
            
//            var output: [String] = []
//            for i in 0...130 {
//                output.append(String(i))
//            }
//            return output
            
        } else if name == "Gender" {
            
            return ["Male", "Female", "Other"]
            
        } else if name == "Skin Type" {
            
            return ["Type 1", "Type 2", "Type 3", "Type 4", "Type 5", "Type 6"]
            
        } else if name == "Eye Colour" {
            
            return ["dark", "light brown", "blonde", "red/red-blonde"]
            
        } else if name == "Hair Colour" {
            
            return ["dark", "blue/blue-grey", "green/grey/hazel"]
            
        } else if name == "Number of Moles" {
            
            return ["0-20", "20-50", "50-100", "100+"]
            
        } else if name == "Freckles" {
            
            return ["Present", "Absent"]
            
        } else if name == "Family History" {
            
            return ["None", "1 member", "more than 1 member"]
            
        } else if name == "Diseases and Conditions" {
            
            return ["Inflammatory Bowel Disease (IBD)", "Human Immunodeficieny Virus (HIV)", "IBD and HIV", "None"]
            
        } else if name == "Body Mass Index" {
            
            return ["<18.5", "18.5-25.9", "26-29.9", "30-34.9", ">35"]
            
        } else {
            
            return ["not configured"]
            
        }

    }
    
    
    func returnNumericalRiskValue(pickerName: String, pickerChoice: String) -> Int16 {
        print(pickerName, pickerChoice)
        
        switch pickerName {
        case "Age":
            // "0-9", "10-19", "20-39", "40-69", "70-99", "100+"
            switch pickerChoice {
            case "0-9":
                return 1
            default:
                return 2
            }
            
        default:
            return 3
        }
        
    }
    
    func calculateFinalRiskFactor(riskFactorsList: [RiskFactors]) -> Float {
        let numItems = riskFactorsList.count
        var totalSum = 0
        
        for riskFactor in riskFactorsList {
            totalSum = totalSum + Int(riskFactor.numericalRiskValue)
        }
        
        return ( Float(totalSum) / Float(numItems) )
    }
}
