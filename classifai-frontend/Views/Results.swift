//
//  Results.swift
//  classifai-frontend
//
//  Created by Eric Wang on 6/11/21.
//

// This will be the results page, "ILL DO IT" in figma

import SwiftUI

struct Results: View {
    var body: some View {
        VStack(alignment: .leading) {
            CircleImage(image: Image("Allen"))
                .padding(.leading, 75.0)
                .padding(.top, 71.0)
                .padding(.bottom, 51.0)
            ResultsMenu()
        }
        .ignoresSafeArea()
    }
}

struct Results_Previews: PreviewProvider {
    static var previews: some View {
        Results()
    }
}
