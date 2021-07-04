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
    @EnvironmentObject var partialSheetManager: PartialSheetManager
//    @Binding var selection: ContentNavigationState?
    @State private var image: Image?
    @State private var showingImagePicker: Bool = false
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
        
        // Send to backend here
        Backend.classifyImage(image: inputImage, completion: { result in
            modelData.labels = result.labels
            modelData.values = result.values
            
            // Navigate to Results view
            selection = "results"
        })
    }
    
    func showPhotoLibrary() -> ImagePicker {
        let imagePicker = ImagePicker(sourceType: .photoLibrary, selectedImage: self.$inputImage)
        return imagePicker
    }
    
    func showCamera() -> ImagePicker {
        let imagePicker = ImagePicker(sourceType: .camera, selectedImage: self.$inputImage)
//        if let imagePickerController = imagePicker.imagePickerController {
//            imagePickerController.cameraFlashMode = .off
//        }
        return imagePicker
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
                showPhotoLibrary()
            }
            .sheet(isPresented: $showingCamera, onDismiss: loadImage) {
                showCamera()

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
