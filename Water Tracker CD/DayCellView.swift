//
//  DayCellView.swift
//  Water Tracker CD
//
//  Created by lincoln anderson on 7/7/20.
//

import SwiftUI

struct DayCellView: View {
    let myFormatter: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM, d"
        return formatter
    }()
    
    var goal: Int
    var progress: Int
    var date: Date
    
    var body: some View {
        HStack {
            VStack {
                HStack{
                    Text("\(self.myFormatter.string(from: date))")
                        .bold()
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                
                    Text("\(goal) Ounces")
                    .foregroundColor(.secondary)
                    
                
                
                    Text("Ounces left \(goal-progress)")
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.secondary)
                    Spacer()
                    
                    
                    
                    
                    
                }
            }
            Spacer()
        }
    }
}

struct DayCellView_Previews: PreviewProvider {
    static var previews: some View {
        DayCellView(goal: 120, progress: 54, date: Date())
    }
}
