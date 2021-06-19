//
//  Results.swift
//  classifai-frontend
//
//  Created by Eric Wang on 6/11/21.
//

// This will be the results page, "ILL DO IT" in figma

import SwiftUI

struct Results: View {
    @EnvironmentObject var modelData: ModelData
    @State var image: Image?
    @State var showingImagePicker: Bool = false
    @State var inputImage: UIImage? // ImagePicker
    @Binding var isShowingResults: Bool
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        modelData.image = image!
        
        // Send to backend here
        Backend.classifyImage(image: inputImage)
        
        // Navigate to Results view
        isShowingResults = true
        showingImagePicker = false
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                CircleImage(image: modelData.image)
                    .frame(width: geometry.size.width*0.6, height: geometry.size.width*0.6, alignment: .topLeading)
                    .padding(.top, geometry.size.height*0.09)
                    .padding(.bottom, geometry.size.height*0.05)
                VStack(alignment: .center, spacing: 5) {
                    HStack {
                        PrimaryLabel(label: modelData.labels[0])
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 2, height: 18)
                            .edgesIgnoringSafeArea(.horizontal)
                        PrimaryValue(value: modelData.values[0])
                    }
                    .padding(.top, 25)
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 50, height: 1)
                        .edgesIgnoringSafeArea(.vertical)
                        .padding(.bottom, 25)
                    HStack (spacing: 80){
                        VStack (alignment: .leading, spacing: 10) {
                            SecondaryLabel(label: modelData.labels[1])
                            SecondaryLabel(label: modelData.labels[2])
                            SecondaryLabel(label: modelData.labels[3])
                        }
                        VStack (alignment: .trailing, spacing: 15){
                            SecondaryValue(value: modelData.values[1])
                            SecondaryValue(value: modelData.values[2])
                            SecondaryValue(value: modelData.values[3])
                        }
                    }
                    Spacer()
                    VStack(alignment: .center) {
                            Button(action: {
                                self.showingImagePicker = true
                            }) {
                                ResultsTryAgainButton(primaryText: "try again")
                            }
                    }
                    .padding(.bottom, 80)

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
                .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                    ImagePicker(selectedImage: self.$inputImage)
                }
            }
            .ignoresSafeArea()
        }
    }
}



struct Results_Previews: PreviewProvider {
    static var previews: some View {
        Results(isShowingResults: .constant(true))
            .environmentObject(ModelData())
    }
}
