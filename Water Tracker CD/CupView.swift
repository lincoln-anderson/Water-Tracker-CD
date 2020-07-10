//
//  CupView.swift
//  Water Tracker CD
//
//  Created by lincoln anderson on 7/9/20.
//

import SwiftUI

struct CupView: View {
    var body: some View {
        cup()
            .fill(Color("40E0D0"))
            .overlay(
                cup()
                .stroke(lineWidth: 15)
                
            )
            .frame(width: 300, height: 600, alignment: .center)
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

struct CupView_Previews: PreviewProvider {
    static var previews: some View {
        CupView()
    }
}
