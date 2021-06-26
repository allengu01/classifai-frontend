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
    
    // https://stackoverflow.com/questions/55626235/how-to-upload-image-multipart-using-alamofire-5-0-0-beta-3-swift-5
    static func classifyImage(image: UIImage, completion: @escaping (Result) -> Void) {
        var result = Result(labels: ["NA", "NA", "NA", "NA"], values: [0, 0, 0, 0])
        let endpoint = "\(ROOT_URL)/api/v1.0/classify"
        let endpoint2 = "https://gqm6zuhev4.execute-api.us-east-2.amazonaws.com/Test/classifai-backend"
        let endpoint3 = "https://hntztmbe26.execute-api.us-east-2.amazonaws.com/default/classifai-backend"
        let headers: HTTPHeaders = ["Accept": "multipart/form-data",
                                    "Content-Type": "multipart/form-data",
                                    "Content-Disposition": "form-data"]
        
//          TESTING
//        AF.upload(multipartFormData: { multipartFormData in
//                    guard let imageData = image.jpegData(compressionQuality: 1) else { return }
//                    multipartFormData.append(imageData, withName: "file", fileName: "file.jpg", mimeType: "image/jpeg")
//        }, to: endpoint3, method: .post, headers: headers).responseString { string in print(string)
//                }
        
        AF.upload(multipartFormData: { multipartFormData in
                    guard let imageData = image.jpegData(compressionQuality: 1) else { return }
                    multipartFormData.append(imageData, withName: "file", fileName: "file.jpg", mimeType: "image/jpeg")
                }, to: endpoint3, method: .post, headers: headers).responseJSON { (response) in
                    print(response)
                    if let jsonData = response.data
                    {
                        let decoder = JSONDecoder()
                        do {
                            result = try decoder.decode(Result.self, from: jsonData)
                            completion(result)
                        } catch {
                            print(String(describing: error))
                            debugPrint(jsonData)
                        }
                    }
                }
    }
}
