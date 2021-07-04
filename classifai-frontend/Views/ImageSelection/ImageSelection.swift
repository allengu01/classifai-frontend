//
//  ImageSelection.swift
//  classifai-frontend
//
//  Created by Allen Gu on 7/4/21.
//

import SwiftUI

struct ImageSelection: View {
    @Binding var showingImageSelection: Bool
    @Binding var showingPhotoLibrary: Bool
    @Binding var showingCamera: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Button(action: {
                showingImageSelection = false
                showingPhotoLibrary = true
            }) {
                ImageSelectionButton(primaryText: "Choose from photo library")
            }
            Button(action: {
                showingImageSelection = false
                showingCamera = true
            }) {
                ImageSelectionButton(primaryText: "Use your camera")
            }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            alignment: .center
        )
        .padding(.vertical, 40)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ImageSelection_Previews: PreviewProvider {
    static var previews: some View {
        ImageSelection(showingImageSelection: .constant(true), showingPhotoLibrary: .constant(false), showingCamera: .constant(false))
    }
}
