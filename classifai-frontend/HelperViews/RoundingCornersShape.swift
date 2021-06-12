//
//  RoundingCornersShape.swift
//  classifai-frontend
//
//  Created by Allen Gu on 6/12/21.
//

import SwiftUI

struct RoundingCornersShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
