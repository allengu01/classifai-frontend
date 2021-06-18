//
//  Loading.swift
//  classifai-frontend
//
//  Created by Eric Wang on 6/17/21.
//

import SwiftUI

struct Loading: View {
    //https://developer.apple.com/documentation/swiftui/progressview?changes=latest_major
    
    @State private var progress = 0.5
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
            Button("More", action: { progress += 0.05 })
        }
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
