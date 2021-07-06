//
//  PrimaryValue.swift
//  classifai-frontend
//
//  Created by Eric Wang on 6/12/21.
//

import SwiftUI

struct PrimaryValue: View {
    var value: Double
    
    var body: some View {
        Text(String(value) + "%")
            .font(Fonts.getFont(.nunito, .regular, 18))
            .foregroundColor(Color(red: 205/255, green: 205/255, blue: 205/255))
    }
}

struct PrimaryValue_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryValue(value: 78)
    }
}
