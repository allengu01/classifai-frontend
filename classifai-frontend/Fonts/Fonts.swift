//
//  Fonts.swift
//  classifai-frontend
//
//  Created by Allen Gu on 6/11/21.
//

import Foundation
import SwiftUI

class Fonts {
    public enum FontFamily: String {
        case nunito = "Nunito"
    }
    
    public enum FontWeight: String {
        case extraBold = "-ExtraBold"
        case extraLight = "-ExtraLight"
        case light = "-Light"
        case regular = "-Regular"
        case semibold = "-SemiBold"
        case bold = "-Bold"
        case black = "-Black"
    }
    
    public static func getFont(_ family: FontFamily, _ weight: FontWeight, _ size: CGFloat) -> Font {
        print("\(family.rawValue)\(weight.rawValue)")
        return Font.custom("\(family.rawValue)\(weight.rawValue)", size: size)
    }
}
