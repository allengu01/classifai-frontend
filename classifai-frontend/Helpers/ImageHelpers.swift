//
//  ImageHelpers.swift
//  classifai-frontend
//
//  Created by Allen Gu on 7/4/21.
//

import Foundation
import UIKit

extension UIImage {
    func scale(targetSize: CGSize) -> UIImage {
        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: targetSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: targetSize
            ))
        }
        
        return scaledImage
    }
}
