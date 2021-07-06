//
//  SecondaryValue.swift
//  classifai-frontend
//
//  Created by Eric Wang on 6/12/21.
//

import SwiftUI

struct SecondaryValue: View {
    var value: Double
    
    var body: some View {
        Text(String(value) + "%")
            .font(Fonts.getFont(.nunito, .regular, 14))
            .foregroundColor(Color(red: 205/255, green: 205/255, blue: 205/255))
    }
}

struct SecondaryValue_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryValue(value: 12)
    }
}
