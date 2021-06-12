//
//  ResultsMenu.swift
//  classifai-frontend
//
//  Created by Eric Wang on 6/12/21.
//

import SwiftUI

struct ResultsMenu: View {
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                PrimaryLabel(label: "dog")
                Spacer()
                PrimaryValue(value: 78)
            }
            HStack {
                SecondaryLabel(label: "beluga whale")
                Spacer()
                SecondaryValue(value: 12)
            }
            ResultsTryAgainButton(primaryText: "try again")
        }
        .padding(.vertical, 0)
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
        .background(RoundingCornersShape(corners: [.topLeft, .topRight], radius: 10)
            .fill(Color(red: 84/255, green: 98/255, blue: 123/255))
        )
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}

struct ResultsMenu_Previews: PreviewProvider {
    static var previews: some View {
        ResultsMenu()
    }
}
