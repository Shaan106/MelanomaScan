//
//  CoreDataManager.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 11/11/21.
//

import Foundation
import CoreData

class CoreDataManager {
    
    //responsible for loading in the model
    let persistenceContainer: NSPersistentContainer
    
    init() {
        persistenceContainer = NSPersistentContainer(name: "RiskFactorsPersistence")
        persistenceContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data store failed \(error.localizedDescription)")
            }
        }
    }
    
    func saveRiskFactor(age: Int16) {
        //instance of riskFactors
        let riskFactors = RiskFactors(context: persistenceContainer.viewContext)
        riskFactors.age = age
        
        do {
            try persistenceContainer.viewContext.save()
        } catch {
            print("Failed to save risk factors \(error)")
        }
    }
}
