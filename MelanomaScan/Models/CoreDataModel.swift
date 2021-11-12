//
//  CoreDataModel.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 12/11/21.
//

import Foundation

class CoreDataModel {
    
    let coreDM = CoreDataManager()
    
    func populateNames() -> [RiskFactors] {
        return coreDM.getAllNames()
    }
    
}
