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
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
