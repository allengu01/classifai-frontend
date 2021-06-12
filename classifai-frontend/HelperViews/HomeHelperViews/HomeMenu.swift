//
//  HomeMenu.swift
//  classifai-frontend
//
//  Created by Allen Gu on 6/12/21.
//

import SwiftUI

struct HomeMenu: View {
    var body: some View {
        VStack(alignment: .center) {
            NavigationLink(
                //THIS IS FUCKING WRONG!!!
                destination: Results(label1: "dog", value1: 78,
                                     label2: "beluga whale", value2: 12,
                                     label3: "cow", value3: 6,
                                     label4: "walrus", value4: 4)) {
                HomeButton(primaryText: "get started", secondaryText: "Take or choose a photo.")
            }
            Spacer()
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
        .padding(.vertical, 40)
        .background(RoundingCornersShape(corners: [.topLeft, .topRight], radius: 10)
            .fill(Color(red: 84/255, green: 98/255, blue: 123/255))
        )
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}

struct HomeMenu_Previews: PreviewProvider {
    static var previews: some View {
        HomeMenu()
    }
}