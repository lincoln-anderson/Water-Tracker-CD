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
    
    @State var showingSubSheet = false
    
    var formatter: DateFormatter
    
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            VStack {
                    Text("Today is \(formatter.string(from:(DaysData.last?.createdAt)!))")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(Color(hex: "404040"))
                    
                    Text("Your goal today is \(DaysData.last!.goal) ounces")
                        .foregroundColor(Color(hex: "404040"))
                
            }
            
            Spacer()
            
            HStack {
                
                Spacer()
                HStack {
                    
                    Spacer()
            
                    Button(action: {
                        
                        self.showingAddSheet.toggle()
                        
                        
                    }) { Text("add water")
                        .bold()
                        .cornerRadius(50)
                            .foregroundColor(Color(hex: "40cac6"))
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color(hex: "404040"), lineWidth: 5))
                        
                        
                    }
                    .foregroundColor(Color(hex: "40cac6"))
                    .sheet(isPresented: $showingAddSheet, onDismiss: {
                        
                        showingAddSheet = false
                        
                    }) {
                        
                        AddSheet(isPresented: $showingAddSheet).environment(\.managedObjectContext, moc)
                        
                    }
                    
                    Spacer()
                }
                Spacer()
                
                HStack {
                    
                    Spacer()
                
                    Button(action: {
                        
                        self.showingSubSheet.toggle()
                        
                        
                    }) { Text("subtract progress")
                        .bold()
                        .cornerRadius(50)
                            .foregroundColor(Color(hex: "40cac6"))
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color(hex: "404040"), lineWidth: 5))
                        
                        
                    }
                    .foregroundColor(Color(hex: "40cac6"))
                    .sheet(isPresented: $showingSubSheet, onDismiss: {
                        
                        showingSubSheet = false
                        
                    }) {
                        
                        SubSheet(isPresented: $showingAddSheet).environment(\.managedObjectContext, moc)
                        
                    }
                    
                    Spacer()
                    
                }
                
                Spacer()
                
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
