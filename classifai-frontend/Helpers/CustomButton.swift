//
//  HomeButton.swift
//  classifai-frontend
//
//  Created by Allen Gu on 6/12/21.
//

import SwiftUI

struct CustomButton: View {
    var primaryText: String
    var secondaryText: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(primaryText)
                .font(Fonts.getFont(.nunito, .bold, 18))
                .foregroundColor(Color(red: 34/255, green: 34/255, blue: 34/255))
                .padding(.leading, 20)
            if (secondaryText != nil) {
                Text(secondaryText!)
                    .font(Fonts.getFont(.nunito, .regular, 14))
                    .foregroundColor(Color(red: 85/255, green: 85/255, blue: 85/255))
                    .padding(.leading, 20)
            }
        }
        .frame(
            width: 260,
            height: 80,
            alignment: .leading
        )
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(primaryText: "get started", secondaryText: "Take or choose a photo.")
    }
}
