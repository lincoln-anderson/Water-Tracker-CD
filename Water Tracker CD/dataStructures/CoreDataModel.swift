//
//  CoreDataModel.swift
//  Water Tracker CD
//
//  Created by lincoln anderson on 9/24/20.
//

import Foundation
import CoreData

class CoreDataModel: ObservableObject {
    
    // My CoreData Stack
    
    @Published var persistentContainer: NSPersistentCloudKitContainer = {
        
        let container = NSPersistentCloudKitContainer(name: "Model")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("error \(error), \(error.userInfo)")
                
            }
        })
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        return container 
        
    }()
    
    
    //CoreData Saving Supoort
    
    func saveContext () {
        
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                
                fatalError("Unfixed Error \(nserror), \(nserror.userInfo)")
                
            }
            
            
        }
        
        
    }
    
}
