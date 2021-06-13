//
//  Home.swift
//  classifai-frontend
//
//  Created by Allen Gu on 6/12/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Logo()
                    .padding(.bottom, geometry.size.height * 0.1)
                    .padding(.leading, geometry.size.width * 0.133)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.4, alignment: .bottomLeading)
                    
                HomeMenu()
            }
            .ignoresSafeArea()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
