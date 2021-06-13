//
//  ModelData.swift
//  classifai-frontend
//
//  Created by Eric Wang on 6/13/21.
//

//BACKEND ARTICLE: https://engineering.nodesagency.com/categories/ios/2020/03/16/Combine-networking-with-a-hint-of-swiftUI

//MAYBE MAKE THIS A CLASS WITH OBSERVABLE OBJECST??
//https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-published-property-wrapper
//https://stackoverflow.com/questions/62544115/what-is-the-difference-between-observedobject-and-stateobject-in-swiftui
//Hashable, Codable, Identifiable

//final class Result: ObservableObject {
//    @Published var image: Image
//}

import Foundation
import Combine

final class ModelData: ObservableObject {
    //@Published var image: Image {
    //    Image(imageName)
    //}
    @Published var labels: [String] = ["sex", "poop", "pee", "bwah"]
    @Published var values: [Int] = [69, 1, 2, 3]
}
