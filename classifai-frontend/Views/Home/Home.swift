//
//  Home.swift
//  classifai-frontend
//
//  Created by Allen Gu on 6/12/21.
//

import SwiftUI

struct Home: View {
//    @State private var photoPickerIsPresented: Bool = false
//    @State private var pickerResult: [UIImage] = [] // PHPicker
    @State private var image: Image?
    @State private var showingImagePicker: Bool = false
    @State private var inputImage: UIImage? // ImagePicker
    @EnvironmentObject var modelData: ModelData
//    @Binding var selection: ContentNavigationState?
    @State private var isShowingResults: Bool = false

    // On dismissing the modal, stores image to environment and sends to backend
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        modelData.image = image!
        
        // Send to backend here
        var input = Input()
        input.image = image
        Backend.classifyImage(input: input)
        
        // Navigate to Results view
        isShowingResults = true
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Logo()
                    .padding(.bottom, geometry.size.height * 0.1)
                    .padding(.leading, geometry.size.width * 0.133)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.4, alignment: .bottomLeading)
                    
                HomeMenu(isShowPhotoLibrary: $showingImagePicker, isShowingResults: $isShowingResults)
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: self.$inputImage)
            }
            .ignoresSafeArea()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(ModelData())
    }
}
