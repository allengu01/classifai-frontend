//
//  TextFieldRow.swift
//  classifai-frontend
//
//  Created by Allen Gu on 7/4/21.
//

import SwiftUI

struct TextFieldRow: View {
    var label: String
    var placeholder: String
    @Binding var text: String
//    @Binding var isEditing: Bool
    
    var body: some View {
        HStack {
            Text(label)
                .font(Fonts.getFont(.nunito, .bold, 18))
                .frame(width: 100, alignment: .leading)
                .fixedSize()
            TextField(placeholder, text: $text)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .font(Fonts.getFont(.nunito, .regular, 18))
                .padding(.horizontal, 10)
                .cornerRadius(5)
                .border(Color(UIColor.separator))
        }
    }
}

struct TextFieldRow_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldRow(label: "Dataset", placeholder: "Dataset name", text: .constant("Dataset"))
    }
}
