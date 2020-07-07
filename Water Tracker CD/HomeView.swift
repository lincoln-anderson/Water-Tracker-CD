//
//  ContentView.swift
//  Water Tracker CD
//
//  Created by lincoln anderson on 7/7/20.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(fetchRequest: DayData.getAllDays()) var DaysData: FetchedResults<DayData>
    
    @State private var newGoal = ""
    
    
    var body: some View {
        NavigationView {
            
            List {
                
                ForEach(self.DaysData) { (day: DayData) in
                    
                    Text(String(day.goal))
                    
                }
                
                
            }
            .navigationBarTitle(Text("Days Logged"))
            .toolbar {
                Spacer()
                #if os(iOS)
                EditButton()
                #endif
                Spacer()
                
                Button("Add", action: makeNewDay)
                Spacer()
            }
            
        }
        
    }
    
    func makeNewDay() {
        
        withAnimation {
            
            let day = DayData(context: self.moc)
            day.createdAt = Date()
            day.goal = 120
            day.progress = 54
            
            do {
                try self.moc.save()
            }catch{
                
                print(error)
                
            }
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
