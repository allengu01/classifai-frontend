//
//  Logo.swift
//  classifai-frontend
//
//  Created by Allen Gu on 6/11/21.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0.0) {
            Text("classif")
                .font(Fonts.getFont(.nunito, .bold, 48))
                .foregroundColor(Color(red: 109/255, green: 158/255, blue: 243/255))
                
            Text("ai")
                .font(Fonts.getFont(.nunito, .bold, 48))
                .foregroundColor(Color(red: 255/255, green: 161/255, blue: 141/255))
        }
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo()
    }
}
