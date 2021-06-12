//
//  Results.swift
//  classifai-frontend
//
//  Created by Eric Wang on 6/11/21.
//

// This will be the results page, "ILL DO IT" in figma

import SwiftUI

struct Results: View {
    var label1: String
    var value1: Int
    var label2: String
    var value2: Int
    var label3: String
    var value3: Int
    var label4: String
    var value4: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            CircleImage(image: Image("Allen"))
                .padding(.leading, 75.0)
                .padding(.top, 71.0)
                .padding(.bottom, 51.0)
            ResultsMenu(label1m: label1, value1m: value1,
                        label2m: label2, value2m: value2,
                        label3m: label3, value3m: value3,
                        label4m: label4, value4m: value4)
            
        }
        .ignoresSafeArea()
    }
}

struct Results_Previews: PreviewProvider {
    static var previews: some View {
        Results(label1: "dog", value1: 78,
                label2: "beluga whale", value2: 12,
                label3: "cow", value3: 6,
                label4: "walrus", value4: 4)
    }
}
