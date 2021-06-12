//
//  ResultsTryAgainButton.swift
//  classifai-frontend
//
//  Created by Eric Wang on 6/12/21.
//

import SwiftUI

struct ResultsTryAgainButton: View {
    var primaryText: String
    
    var body: some View {
        Text(primaryText)
            .font(Fonts.getFont(.nunito, .bold, 18))
            .foregroundColor(Color(red: 34/255, green: 34/255, blue: 34/255))
            .padding(.leading, 2)
            .frame(
                width: 126,
                height: 47,
                alignment: .center
            )
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}

struct ResultsTryAgainButton_Previews: PreviewProvider {
    static var previews: some View {
        ResultsTryAgainButton(primaryText: "try again")
    }
}
