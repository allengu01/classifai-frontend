//
//  HomeMenu.swift
//  classifai-frontend
//
//  Created by Allen Gu on 6/12/21.
//

import SwiftUI

struct HomeMenu: View {
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                NavigationLink(
                    destination: Results()) {
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
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .background(Color(red: 84/255, green: 98/255, blue: 123/255))
    }
}

struct HomeMenu_Previews: PreviewProvider {
    static var previews: some View {
        HomeMenu()
    }
}
