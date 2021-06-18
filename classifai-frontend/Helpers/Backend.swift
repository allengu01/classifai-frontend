//
//  Backend.swift
//  classifai-frontend
//
//  Created by Allen Gu on 6/17/21.
//

import Foundation

class Backend {
    final var ROOT_URL = "https://127.0.0.1:5000"
    
    static func classifyImage(input: Input) {
        guard encodedInput = try? JSONEncoder().encode(input) else {
            print("Failed to encode input")
            return
        }
    }
}
