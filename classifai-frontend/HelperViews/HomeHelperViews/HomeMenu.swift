//
//  HomeMenu.swift
//  classifai-frontend
//
//  Created by Allen Gu on 6/12/21.
//

import SwiftUI

struct HomeMenu: View {
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                self.isShowPhotoLibrary = true
            }) {
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
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
        
    }
}

struct HomeMenu_Previews: PreviewProvider {
    static var previews: some View {
        HomeMenu()
    }
}
