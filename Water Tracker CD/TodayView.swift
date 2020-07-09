//
//  TodayView.swift
//  Water Tracker CD
//
//  Created by lincoln anderson on 7/9/20.
//

import SwiftUI

struct TodayView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(fetchRequest: DayData.getAllDays()) var DaysData: FetchedResults<DayData>
    
    @State var showingDataView = false
    
    var formatter: DateFormatter
    
    
    var body: some View {
        
        NavigationView {
            List {
                Text("Today is \(formatter.string(from:(DaysData.last?.createdAt)!))")
                    .fontWeight(.bold)
                    .font(.title)
                
                Text("Your Goal is \(DaysData.last!.goal)")
                Text("You have drank \(DaysData.last!.progress) so far today")
                Text("You have \(DaysData.last!.goal - DaysData.last!.progress) ounces left for the day")
            
            }
            .toolbar {
                
                Button("past days", action: {
                    
                    self.showingDataView.toggle()
                    
                }).sheet(isPresented: $showingDataView, onDismiss: {
                    
                    showingDataView = false
                    
                }) {
                    
                    DataView(DaysData: DaysData).environment(\.managedObjectContext, moc)
                    
                }
                
            }
            
        }
        
        
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView(formatter: DateFormatter())
    }
}
