//
//  Home.swift
//  classifai-frontend
//
//  Created by Allen Gu on 6/12/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(alignment: .leading) {
            Logo()
                .padding(.leading, 58.0)
                .padding(.top, 155.0)
                .padding(.bottom, 93.0)
            HomeMenu()
        }
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
