//
//  Font++.swift
//  Travel Mate
//
//  Created by Dilshad N on 04/01/23.
//

import Foundation
import SwiftUI

enum CustomFont: String {
    case light = "BaiJamjuree-Light"
    case regular = "BaiJamjuree-Regular"
    case bold = "BaiJamjuree-Bold"
    case semiBold = "BaiJamjuree-SemiBold"
    case medium = "BaiJamjuree-Medium"
}

extension Font {
    static func custom(_ font: CustomFont, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
}
