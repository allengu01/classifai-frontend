//
//  PrimaryLabel.swift
//  classifai-frontend
//
//  Created by Eric Wang on 6/12/21.
//

import SwiftUI

struct PrimaryLabel: View {
    var label: String
    
    var body: some View {
        Text(label)
            .font(Fonts.getFont(.nunito, .bold, 24))
            .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255))
    }
}

struct PrimaryLabel_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
            PrimaryLabel(label: "dog")
        }
    }
}
