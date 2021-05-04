//
//  SubSheet.swift
//  Water Tracker CD
//
//  Created by lincoln anderson on 9/23/20.
//

import SwiftUI

struct SubSheet: View {
    
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
                Slider(value: $progressAdded, in: 0...Double(DaysData.last!.progress), step: 1)
                    .accentColor(Color(hex: "40cac6"))
                Text("\(DaysData.last!.progress)")
                    .foregroundColor(Color(hex: "40cac6"))
                
            }
            Spacer()
            
            Button(action: {
                
                self.updateProgress(day: self.DaysData.last!, newProgress: Int64(Int(self.progressAdded)))

                self.isPresented = false
                
            }) {
                Text("Subtract Progress")
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
        day.setValue(day.progress - newProgress, forKey: "progress")
        
        try? self.moc.save()
        
    }
}

//struct SubSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        SubSheet()
//    }
//}
