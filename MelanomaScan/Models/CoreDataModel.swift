//
//  CoreDataModel.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 12/11/21.
//

import Foundation

class CoreDataModel {
    
    func resetRiskFactors(coreDataManager: CoreDataManager, listOfRiskFactors: [String]) {
        
        coreDataManager.deleteAllRiskFactors()
        
        for item in listOfRiskFactors {
            coreDataManager.saveRiskFactorValue(stringValue: item)
        }
        
    }
    
}
