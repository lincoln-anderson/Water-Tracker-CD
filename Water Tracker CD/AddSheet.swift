//
//  AddSheet.swift
//  Water Tracker CD
//
//  Created by lincoln anderson on 7/11/20.
//

import SwiftUI

struct AddSheet: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(fetchRequest: DayData.getAllDays()) var DaysData: FetchedResults<DayData>
    
    @State private var progressAdded: Double = 0
    
    @Binding var isPresented: Bool
    
    var body: some View {
        
        VStack{
            
            Spacer()
            Text("\(progressAdded)")
                .foregroundColor(Color(hex: "40cac6"))
                .font(.largeTitle)
                .bold()
            
            Spacer()
            
            HStack {
                Text("0")
                    .foregroundColor(Color(hex: "40cac6"))
                Slider(value: $progressAdded, in: 0...Double(DaysData.last!.goal), step: 1)
                    .accentColor(Color(hex: "40cac6"))
                Text("\(DaysData.last!.goal)")
                    .foregroundColor(Color(hex: "40cac6"))
                
            }
            Spacer()
            
            Button(action: {
                
                updateProgress(day: DaysData.last!, newProgress: Int64(Int(progressAdded)))
                
//                do {
//                    DaysData.last!.setValue(DaysData.last!.progress + Int64(Int(progressAdded)), forKey: "progress")
//
//                    try self.moc.save()
//                }catch{
//
//                    print(error)
//
//                }

                self.isPresented = false
                
            }) {
                Text("Add to Progress")
                .fontWeight(.bold)
                .font(.title)
                .padding(30)
                .background(Color(hex: "404040"))
                .cornerRadius(50)
                    .foregroundColor(Color(hex: "40cac6"))
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color(hex: "404040"), lineWidth: 5)
                
                )}
        }
        
    }
    
    func updateProgress(day: DayData, newProgress: Int64) {
        day.setValue(newProgress + day.progress, forKey: "progress")
        
        try? self.moc.save()
        
    }
}

//struct AddSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        AddSheet(isPresented: true)
//    }
//}
