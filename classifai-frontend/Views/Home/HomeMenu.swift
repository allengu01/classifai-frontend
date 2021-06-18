//
//  HomeMenu.swift
//  classifai-frontend
//
//  Created by Allen Gu on 6/12/21.
//

import SwiftUI

struct HomeMenu: View {
    @Binding var showingImagePicker: Bool
    @Binding var isShowingResults: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            NavigationLink(destination: Results(isShowingResults: $isShowingResults), isActive: $isShowingResults) {
                Button(action: {
                    self.showingImagePicker = true
                }) {
                    HomeButton(primaryText: "get started", secondaryText: "Take or choose a photo.")
                }
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
        HomeMenu(showingImagePicker: .constant(false), isShowingResults: .constant(false))
    }
}
