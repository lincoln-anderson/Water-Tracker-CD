//
//  HexColorExtension.swift
//  Water Tracker CD
//
//  Created by lincoln anderson on 7/10/20.
//

import Foundation
import SwiftUI

public extension Color {
    
    init(hex: String) {
        
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        
        var int: UInt64 = 0
        
        Scanner(string: hex).scanHexInt64(&int)
        
        let r, g, b: UInt64
        
        switch hex.count {
            
        case 3: //3 of the same value input
            
            (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            
        case 6:
            
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
            
        default:
            
            (r, g, b) = (1, 1, 0)
            
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255
        )
        
    }
    
}
