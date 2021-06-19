//
//  Backend.swift
//  classifai-frontend
//
//  Created by Allen Gu on 6/17/21.
//

import Foundation
import SwiftUI
import UIKit
import Alamofire

class Backend {
    static var ROOT_URL = "http://127.0.0.1:5000"
    @EnvironmentObject var modelData: ModelData
    
    // https://stackoverflow.com/questions/55626235/how-to-upload-image-multipart-using-alamofire-5-0-0-beta-3-swift-5
    static func classifyImage(image: UIImage) {
        let endpoint = "\(ROOT_URL)/api/v1.0/classify"
        
        let headers: HTTPHeaders = ["Content-Type": "multipart/form-data",
                                    "Content-Disposition": "form-data"]
        
        AF.upload(multipartFormData: { multipartFormData in
            guard let imageData = image.jpegData(compressionQuality: 1) else { return }
            multipartFormData.append(imageData, withName: "file", fileName: "file.jpg", mimeType: "image/jpeg")
        }, to: endpoint, method: .post, headers: headers).responseJSON {
                response in
            debugPrint(response)
        }
    }
}
