//
//  DayCellView.swift
//  Water Tracker CD
//
//  Created by lincoln anderson on 7/7/20.
//

import SwiftUI

struct DayCellView: View {
    static let myFormatter: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter
    }()
    
    var goal: Int
    var progress: Int
    var date: String
    
    var body: some View {
        HStack {
            VStack {
                Text("\(goal) Ounces")
                    .bold()
                    .font(.title)
                    .padding(.trailing,200)
                    
                
                HStack {
                    Text("Ounces left \(goal-progress)")
                        .multilineTextAlignment(.trailing)
                        .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    Spacer()
                    
                    
                    
                    Text(date)
                        .foregroundColor(.secondary)
                        .padding(.trailing, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                }
            }
            Spacer()
        }
    }
}

struct DayCellView_Previews: PreviewProvider {
    static var previews: some View {
        DayCellView(goal: 120, progress: 54, date: "")
    }
}
