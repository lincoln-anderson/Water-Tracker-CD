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
        
        VStack {
            NavigationView {
                List {
                    Text("Today is \(formatter.string(from:(DaysData.last?.createdAt)!))")
                        .fontWeight(.bold)
                        .font(.title)
                    
                    Text("Youre goal today is \(DaysData.last!.goal) ounces")
                    
                }
                .toolbar {
                    
                    Button("past days", action: {
                        
                        self.showingDataView.toggle()
                        
                    }).sheet(isPresented: $showingDataView, onDismiss: {
                        
                        showingDataView = false
                        
                    }) {
                        
                        DataSheet(DaysData: DaysData).environment(\.managedObjectContext, moc)
                        
                    }
                    
                }
                
                
            }
//            Text("Your Goal is \(DaysData.last!.goal)")
//            Text("You have drank \(DaysData.last!.progress) so far today")
//            Text("You have \(DaysData.last!.goal - DaysData.last!.progress) ounces left for the day")
            CupView()
            Spacer()
        }
        
        
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView(formatter: DateFormatter())
    }
}
