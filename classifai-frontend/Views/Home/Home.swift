//
//  Home.swift
//  classifai-frontend
//
//  Created by Allen Gu on 6/12/21.
//

import SwiftUI
import PartialSheet

struct Home: View {
//    @State private var photoPickerIsPresented: Bool = false
//    @State private var pickerResult: [UIImage] = [] // PHPicker
    @EnvironmentObject var modelData: ModelData
//    @Binding var selection: ContentNavigationState?
    @State private var image: Image?
    @State private var showingImageSelection: Bool = false
    @State private var showingPhotoLibrary: Bool = false
    @State private var showingCamera: Bool = false
    @State private var inputImage: UIImage? // ImagePicker
    @State private var selection: String?
    
    // On dismissing the modal, stores image to environment and sends to backend
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        modelData.image = image!
        
        let scaledImage = inputImage.scale(targetSize: CGSize(width: 100, height: 100))
            // Send to backend here
        Backend.classifyImage(image: scaledImage, completion: { result in
            modelData.labels = result.labels
            modelData.values = result.values
            
            // Navigate to Results view
            selection = "results"
        })
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Logo()
                    .padding(.bottom, geometry.size.height * 0.1)
                    .padding(.leading, geometry.size.width * 0.133)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.4, alignment: .bottomLeading)
                    
                HomeMenu(showingImageSelection: $showingImageSelection, selection: $selection)
                
            }
            .partialSheet(isPresented: $showingImageSelection) {
                ImageSelection(showingImageSelection: $showingImageSelection, showingPhotoLibrary: $showingPhotoLibrary, showingCamera: $showingCamera)
            }
            .sheet(isPresented: $showingPhotoLibrary, onDismiss: loadImage) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$inputImage)
            }
            .sheet(isPresented: $showingCamera, onDismiss: loadImage) {
                ImagePicker(sourceType: .camera, selectedImage: self.$inputImage)
            }
            .ignoresSafeArea()
        }
        .addPartialSheet(style: PartialSheetStyle(background: .solid(Color.white), accentColor: Color(UIColor.systemGray2), enableCover: true, coverColor: Color.black.opacity(0.4), cornerRadius: 20, minTopDistance: 0)
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(ModelData())
    }
}
