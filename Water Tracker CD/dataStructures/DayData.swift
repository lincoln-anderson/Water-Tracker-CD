//
//  DayData.swift
//  Water Tracker CD
//
//  Created by lincoln anderson on 7/7/20.
//

import Foundation
import CoreData

public class DayData: NSManagedObject, Identifiable {
    
    @NSManaged public var goal: Int64
    
    @NSManaged public var createdAt: Date?
    
    @NSManaged public var progress: Int64
    
    @NSManaged public var printDate: String
    
}

extension DayData {
    
    static func getAllDays() -> NSFetchRequest<DayData> {
        
        let request:NSFetchRequest<DayData> = NSFetchRequest<DayData>(entityName: "DayData") 
        
        let sorter = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sorter]
        
        return request
        
        
    }
    
}
