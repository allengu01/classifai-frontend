//
//  CreateDataset.swift
//  classifai-frontend
//
//  Created by Allen Gu on 7/4/21.
//

import SwiftUI
import PartialSheet

struct CreateDataset: View {
    @Binding var selection: String?
    @State var dataset: String = ""
    @State var label: String = ""
    @State var isEditingDataset = false
    @State var isEditingLabel = false
    
    @State private var showingImageSelection: Bool = false
    @State private var showingPhotoLibrary: Bool = false
    @State private var showingCamera: Bool = false
    @State private var inputImage: UIImage? // ImagePicker
    
    // On dismissing the modal, stores image to environment and sends to backend
    func loadImage() {
        guard let inputImage = inputImage else { return }
        let scaledImage = inputImage.scale(targetSize: CGSize(width: 100, height: 100))
        // Send to backend here
        Backend.addToDataset(image: scaledImage, dataset: dataset, label: label) { result in
            
        }
    }
    
    var body: some View {
        VStack(alignment: .center) {
            TextFieldRow(label: "Dataset:", placeholder: "Dataset name", text: $dataset, isEditing: $isEditingDataset)
                .padding(.horizontal, 20)
                .padding(.top, 120)
            TextFieldRow(label: "Label:", placeholder: "Image label", text: $label, isEditing: $isEditingLabel)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            VStack {
                Button(action: {
                    showingImageSelection = true
                }) {
                    CustomButton(primaryText: "add an image", secondaryText: "Take a picture or choose from the photo library.")
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
        .addPartialSheet(style: PartialSheetStyle(background: .solid(Color.white), accentColor: Color(UIColor.systemGray2), enableCover: true, coverColor: Color.black.opacity(0.4), cornerRadius: 20, minTopDistance: 0)
        )
    }
}

struct CreateDataset_Previews: PreviewProvider {
    static var previews: some View {
        CreateDataset(selection: .constant("results"))
    }
}
