//
//  CupView.swift
//  Water Tracker CD
//
//  Created by lincoln anderson on 7/9/20.
//

import SwiftUI

struct CupView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @State var goal: CGFloat
    
    @State var progress: CGFloat
    
    var body: some View {
        VStack {
            Text("\(Int(progress/goal*100))% done!")
                .bold()
                .font(.title)
            cup()
                .trim(from: 0, to: getProgress())
                .fill(Color(hex: "40cac6"))
                .overlay(
                    cup()
                    .stroke(lineWidth: 15)
                        .foregroundColor(Color(hex: "404040"))
                    
                )
                .frame(width: 300, height: 550, alignment: .center)
        }
    }
    
    func getProgress() -> CGFloat {
        
        var passedProgress = progress
        
        let passedGoal = goal
        
        switch passedProgress {
        case 0 :
            passedProgress = 0
        default:
            passedProgress = passedProgress/passedGoal
            
            passedProgress = passedProgress * 0.55
            
            passedProgress = passedProgress + 0.40
            
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
