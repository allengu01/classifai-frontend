//
//  CreateDataset.swift
//  classifai-frontend
//
//  Created by Allen Gu on 7/4/21.
//

import SwiftUI

struct CreateDataset: View {
    @Binding var selection: String?
    @State var dataset: String = ""
    @State var label: String = ""
    @State var isEditing = false
    
    var body: some View {
        VStack(alignment: .leading) {
            TextFieldRow(label: "Dataset:", placeholder: "Dataset name", text: $dataset, isEditing: $isEditing)
                .padding(.horizontal, 20)
            TextFieldRow(label: "Label:", placeholder: "Image label", text: $label, isEditing: $isEditing)
                .padding(.horizontal, 20)
            Spacer()
        }
    }
}

struct CreateDataset_Previews: PreviewProvider {
    static var previews: some View {
        CreateDataset(selection: .constant("results"))
    }
}
