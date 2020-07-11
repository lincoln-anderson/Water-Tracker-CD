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
    
    @State var showingDataSheet = false
    
    @State var showingAddSheet = false
    
    var formatter: DateFormatter
    
    
    var body: some View {
        
        VStack {
            
            NavigationView {
                List {
                    Text("Today is \(formatter.string(from:(DaysData.last?.createdAt)!))")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(Color(hex: "404040"))
                    
                    Text("Your goal today is \(DaysData.last!.goal) ounces")
                        .foregroundColor(Color(hex: "404040"))
                    
                }
                .toolbar {
                    Button("add water", action: {
                        
                        self.showingAddSheet.toggle()
                        
                        
                    })
                    .foregroundColor(Color(hex: "40cac6"))
                    .sheet(isPresented: $showingAddSheet, onDismiss: {
                        
                        showingAddSheet = false
                        
                    }) {
                        
                        AddSheet(isPresented: $showingAddSheet).environment(\.managedObjectContext, moc)
                        
                    }
                    
//                    Button("past days", action: {
//
//                        self.showingDataSheet.toggle()
//
//                    })
//                    .foregroundColor(Color(hex: "40cac6"))
//                    .sheet(isPresented: $showingDataSheet, onDismiss: {
//
//                        showingDataSheet = false
//
//                    }) {
//
//                        DataSheet().environment(\.managedObjectContext, moc)
//
//                    }
                    
                    
                    
                }
                
            }
            
            CupView().environment(\.managedObjectContext, moc)
            Spacer()
            Text("\(DaysData.last!.progress)/\(DaysData.last!.goal) Ounces drank")
                .bold()
                .foregroundColor(Color(hex: "404040"))
            
                
        }
        
        
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView(formatter: DateFormatter())
    }
}
