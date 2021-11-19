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
    
    //returns a list of risk factor choices to be used by the picker in the information page.
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
            
            return ["dark", "blue/blue-grey", "green/grey/hazel"]
            
        } else if name == "Hair Colour" {
            
            return ["dark", "light brown", "blonde", "red/red-blonde"]
            
        } else if name == "Number of Moles" {
            
            return ["0-20", "20-100", "100+"]
            
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
    
    //returns the numerical risk value associated with the chosen risk factor
    func returnNumericalRiskValue(pickerName: String, pickerChoice: String) -> Int16 {
        print(pickerName, pickerChoice)
        
        switch pickerName {
        case "Age":
            return 0
        
        case "Gender":
            return 0
            
        case "Skin Type":
            if pickerChoice == "1"{
                return 4
            } else if pickerChoice == "2" || pickerChoice == "3" {
                return 2
            } else if pickerChoice == "4" {
                return 1
            } else {
                return 0
            }
            
        case "Eye Colour":
            if pickerChoice == "green/grey/hazel" || pickerChoice == "blue/blue-grey" {
                return 3
            } else if pickerChoice == "dark" {
                return 1
            } else {
                return 0
            }
            
        case "Hair Colour":
            if pickerChoice == "red/red-blonde" {
                return 4
            } else if pickerChoice == "blonde" {
                return 3
            } else if pickerChoice == "light brown" {
                return 2
            } else if pickerChoice == "dark" {
                return 1
            } else {
                return 0
            }
        
        case "Number of Moles":
            if pickerChoice == "0-20" {
                return 1
            } else if pickerChoice == "20-100" {
                return 2
            } else if pickerChoice == "100+" {
                return 3
            } else {
                return 0
            }
            
        case "Freckles":
            if pickerChoice == "Present" {
                return 3
            } else if pickerChoice == "Absent" {
                return 1
            } else {
                return 0
            }
        
        case "Family History":
            if pickerChoice == "None" {
                return 1
            } else if pickerChoice == "1 member" {
                return 4
            } else if pickerChoice == "more than 1 member" {
                return 5
            } else {
                return 0
            }
        
        case "Diseases and Conditions":
            if pickerChoice == "Inflammatory Bowel Disease (IBD)" {
                return 4
            } else if pickerChoice == "Human Immunodeficieny Virus (HIV)" {
                return 4
            } else if pickerChoice == "IBD and HIV" {
                return 5
            } else if pickerChoice == "None" {
                return 1
            } else {
                return 0
            }
        
        case "Body Mass Index":
            if pickerChoice == "<18.5" || pickerChoice == "18.5-25.9" {
                return 1
            } else if pickerChoice == "26-29.9" {
                return 2
            } else if pickerChoice == "30-34.9" || pickerChoice == ">35" {
                return 3
            } else {
                return 0
            }
            
        default:
            return 0
        }
        
    }
    
    //calculates the sum of risk factors
    func calculateFinalRiskFactor(riskFactorsList: [RiskFactors]) -> String {
        let numItems = riskFactorsList.count - 2 //because age and gender are not taken into consideration for melanoma risk
        var totalSum = 0
        
        for riskFactor in riskFactorsList {
            if riskFactor.value == "n/a" {
                return "Risk Factors not filled out yet."
            }
            totalSum = totalSum + Int(riskFactor.numericalRiskValue)
        }
        
        //total sum is numerical averge, use count of diff factors to give a final statement, ie "high risk" because more than 3 "5" values.
        
        return String( ( Float(totalSum) / Float(numItems) ) )
    }
}
