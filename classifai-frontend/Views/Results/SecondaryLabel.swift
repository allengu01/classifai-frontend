//
//  SecondaryLabel.swift
//  classifai-frontend
//
//  Created by Eric Wang on 6/12/21.
//

import SwiftUI

struct SecondaryLabel: View {
    var label: String
    
    var body: some View {
        Text(label)
            .font(Fonts.getFont(.nunito, .bold, 18))
            .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255))
    }
}

struct SecondaryLabel_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
            SecondaryLabel(label: "beluga whale")
        }
    }
}
