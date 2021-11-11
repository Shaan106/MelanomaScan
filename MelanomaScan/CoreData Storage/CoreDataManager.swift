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
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "RiskFactorsPersistence")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data store failed \(error.localizedDescription)")
            }
        }
    }
    
    //saves the current risk factor (age only in this case)
//    func saveRiskFactorAge(age: Int16) {
//        //instance of riskFactors
//        let riskFactors = RiskFactors(context: persistentContainer.viewContext)
//        riskFactors.age = age
//
//        do {
//            try persistentContainer.viewContext.save()
//        } catch {
//            print("Failed to save risk factors \(error)")
//        }
//    }
    
    func saveRiskFactorName(name: String) {
        //instance of riskFactors
        let riskFactors = RiskFactors(context: persistentContainer.viewContext)
        riskFactors.name = name
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save risk factors \(error)")
        }
    }
    
    //returns all the saved ages
    func getAllNames() -> [RiskFactors] {
        
        let fetchRequest: NSFetchRequest<RiskFactors> = RiskFactors.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
}
