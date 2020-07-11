//
//  TodayGridView.swift
//  Water Tracker CD
//
//  Created by lincoln anderson on 7/10/20.
//

import SwiftUI

struct TodayGridView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(fetchRequest: DayData.getAllDays()) var DaysData: FetchedResults<DayData>
    
    @State var showingDataView = false
    
    let columns = [
        GridItem(.adaptive(minimum: 20))
    
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                
                ForEach(self.DaysData) { (day: DayData) in
                    
                    Text(String(day.goal))
                    
                }
                
            }
            
            
            
            
        }
    }
}

struct TodayGridView_Previews: PreviewProvider {
    static var previews: some View {
        TodayGridView()
    }
}
