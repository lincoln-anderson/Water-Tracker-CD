//
//  ContentView.swift
//  Water Tracker CD
//
//  Created by lincoln anderson on 7/7/20.
//

import SwiftUI

struct DataSheet: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(fetchRequest: DayData.getAllDays()) var DaysData: FetchedResults<DayData>
    
    @State private var newGoal = ""
    
    
    
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(self.DaysData) { day in
                    
                    DayCellView(goal: Int("\(day.goal)")!, progress: Int("\(day.progress)")!, date: day.createdAt ?? Date())
                    
                }
                .onDelete { indexSet in
                    
                    deleteDay(indexSet: indexSet)
                }
                
            }
            .navigationTitle("Days Logged")
            
            
            
        }
        
    }
    
    func makeNewDay() {
        
        withAnimation {
            
            let day = DayData(context: self.moc)
            day.createdAt = Date()
            day.goal = 150
            day.progress = 54
            
            do {
                try self.moc.save()
            }catch{
                
                print(error)
                
            }
            
        }
        
    }
    
    func deleteDay(indexSet: IndexSet) {
        let deleteItem = self.DaysData[indexSet.first!]
        self.moc.delete(deleteItem)
        
        do {
            try self.moc.save()
        
        }catch {
            
            print(error)
            
        }
        
        
        
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        
//        DataView(DaysData:)
//    }
//}
