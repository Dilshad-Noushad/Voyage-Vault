//
//  Color++.swift
//  Travel Mate
//
//  Created by Dilshad N on 04/01/23.
//

import Foundation
import SwiftUI

extension Color {
    static let greenColor = Color("greenColor")
    static let blackColor = Color("blackColor")
    static let bgWhite = Color("bgWhite")
}

extension UIColor {
    static let greenColor = Color("greenColor")
    static let blackColor = Color("blackColor")
    static let bgWhite = Color("bgWhite")
    
    private static func Color(_ key: String) -> UIColor {
        if let color = UIColor(named: key, in: .main, compatibleWith: nil) {
            return color
        }
        
        return .black
    }
}
