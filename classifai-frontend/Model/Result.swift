//
//  Result.swift
//  classifai-frontend
//
//  Created by Eric Wang on 6/12/21.
//

import Foundation
import SwiftUI
import CoreLocation

//BACKEND ARTICLE: https://engineering.nodesagency.com/categories/ios/2020/03/16/Combine-networking-with-a-hint-of-swiftUI

//MAYBE MAKE THIS A CLASS WITH OBSERVABLE OBJECST??
//https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-published-property-wrapper
//https://stackoverflow.com/questions/62544115/what-is-the-difference-between-observedobject-and-stateobject-in-swiftui
//Hashable, Codable, Identifiable

//final class Result: ObservableObject {
//    @Published var image: Image
//}

struct resultObject {
    var image: Image
    var label1: String
    var label2: String
    var label3: String
    var label4: String
    var value1: Int
    var value2: Int
    var value3: Int
    var value4: Int
}
