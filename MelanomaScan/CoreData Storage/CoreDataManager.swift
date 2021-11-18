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
        persistentContainer = NSPersistentContainer(name: "CoreDataStore")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data store failed \(error.localizedDescription)")
            }
        }
    }
    
    //saves the current risk factor (only the name in this case)
    func saveRiskFactorValue(stringValue: String) {
        //instance of riskFactors
        let riskFactors = RiskFactors(context: persistentContainer.viewContext)
        riskFactors.name = stringValue
        riskFactors.value = "n/a"
        riskFactors.numericalRiskValue = -1
        
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
    
    //deletes from memory
    func deleteRiskFactor(riskFactor: RiskFactors) {
        
        persistentContainer.viewContext.delete(riskFactor)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error)")
        }
    }
    
    func deleteAllRiskFactors() {

        let allRiskFactors: [RiskFactors] = getAllNames()
        
        for savedRiskFactor in allRiskFactors {
            persistentContainer.viewContext.delete(savedRiskFactor)
        }
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error)")
        }
        
    }
    
    func updateRiskFactor() {
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
    }
}
