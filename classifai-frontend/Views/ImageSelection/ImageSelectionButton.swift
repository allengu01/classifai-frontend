//
//  ImageSelectionButton.swift
//  classifai-frontend
//
//  Created by Allen Gu on 7/4/21.
//

import SwiftUI

struct ImageSelectionButton: View {
    var primaryText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(primaryText)
                .font(Fonts.getFont(.nunito, .bold, 14))
                .foregroundColor(Color.white)
                .padding(.leading, 20)
        }
        .frame(
            width: 260,
            height: 50,
            alignment: .leading
        )
        .background(Color(red: 34/255, green: 34/255, blue: 34/255))
        .cornerRadius(10)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}

struct ImageSelectionButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageSelectionButton(primaryText: "Choose from Photo Library")
    }
}
