//
//  CupView.swift
//  Water Tracker CD
//
//  Created by lincoln anderson on 7/9/20.
//

import SwiftUI

struct CupView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(fetchRequest: DayData.getAllDays()) var DaysData: FetchedResults<DayData>
    
    var body: some View {
        HStack {
            Text("\(Int(CGFloat(DaysData.last!.progress)/CGFloat(DaysData.last!.goal)*100))% done!")
                .bold()
                .font(.title)
                .foregroundColor(Color(hex: "40cac6"))
            cup()
                .trim(from: 0, to: getProgress())
                .fill(Color(hex: "40cac6"))
                .overlay(
                    cup()
                    .stroke(lineWidth: 15)
                        .foregroundColor(Color(hex: "404040"))
                    
                )
                .frame(width: 270, height: 550, alignment: .center)
        }
    }
    
    func getProgress() -> CGFloat {
        
        var passedProgress = CGFloat(DaysData.last!.progress)
        
        let passedGoal = CGFloat(DaysData.last!.goal)
        
        switch passedProgress {
        case 0 :
            passedProgress = 0
        default:
            passedProgress = passedProgress/passedGoal
            
            passedProgress = passedProgress * 0.55
            
            passedProgress = passedProgress + 0.38
            
        }
        
        return passedProgress
    }
}

struct cup: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            let width = rect.width
            let height = rect.height
            
            path.addLines ( [
                
                CGPoint(x: width * 1.08, y: height * 0.4),
                CGPoint(x: width, y: height),
                CGPoint(x: width * 0.4, y: height),
                CGPoint(x: width * 0.32, y: height * 0.4),
                
            ])
        }
    }
}

//struct CupView_Previews: PreviewProvider {
//    static var previews: some View {
//        CupView()
//    }
//}
