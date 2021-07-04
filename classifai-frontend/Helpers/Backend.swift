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
//    static var ROOT_URL = "http://127.0.0.1:5000"
    static var ROOT_URL = "http://192.168.1.68:5000"
    
    // https://stackoverflow.com/questions/55626235/how-to-upload-image-multipart-using-alamofire-5-0-0-beta-3-swift-5
    static func classifyImage(image: UIImage, completion: @escaping (Result) -> Void) {
        let endpoint = "\(ROOT_URL)/api/v1.0/classify"
        multipartRequest(endpoint: endpoint, parameters: [:], image: image, responseObject: Result.self) { response in
            completion(response.body)
        }
    }
    
    static func addToDataset(image: UIImage, dataset: String, label: String, completion: @escaping (Result) -> Void) {
        let endpoint = "\(ROOT_URL)/api/v1.0/createDataset"
        multipartRequest(endpoint: endpoint, parameters: ["dataset": dataset, "label": label], image: image, responseObject: Result.self) { response in
            completion(response.body)
        }
    }
    
    static func multipartRequest<T: Codable>(endpoint: String, parameters: Dictionary<String, String>, image: UIImage, responseObject: T.Type, completion: @escaping (Response<T>) -> Void) {
        let headers: HTTPHeaders = ["Accept": "multipart/form-data",
                                    "Content-Type": "multipart/form-data",
                                    "Content-Disposition": "form-data"]
        AF.upload(multipartFormData: { multipartFormData in
            for (key, value) in parameters {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
    
            guard let imageData = image.jpegData(compressionQuality: 1) else { return }
            multipartFormData.append(imageData, withName: "file", fileName: "file.jpg", mimeType: "image/jpeg")
        }, to: endpoint, method: .post, headers: headers).responseJSON { (response) in
            print(response)
            if let jsonData = response.data
            {
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(Response<T>.self, from: jsonData)
                    completion(response)
                } catch {
                    print(String(describing: error))
                    debugPrint(jsonData)
                }
            }
        }
    }
}
