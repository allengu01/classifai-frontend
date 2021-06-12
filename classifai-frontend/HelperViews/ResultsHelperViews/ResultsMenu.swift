//
//  ResultsMenu.swift
//  classifai-frontend
//
//  Created by Eric Wang on 6/12/21.
//

import SwiftUI

struct ResultsMenu: View {
    var label1m: String
    var value1m: Int
    var label2m: String
    var value2m: Int
    var label3m: String
    var value3m: Int
    var label4m: String
    var value4m: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            HStack {
                PrimaryLabel(label: label1m)
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 2, height: 18)
                    .edgesIgnoringSafeArea(.horizontal)
                PrimaryValue(value: value1m)
            }
            Rectangle()
                .fill(Color.white)
                .frame(width: 50, height: 1)
                .edgesIgnoringSafeArea(.vertical)
                .padding(.bottom, 25)
            HStack {
                SecondaryLabel(label: label2m)
                SecondaryValue(value: value2m)
            }
            .padding(.bottom, 8)
            HStack {
                SecondaryLabel(label: label3m)
                SecondaryValue(value: value2m)
            }
            .padding(.bottom, 8)
            HStack {
                SecondaryLabel(label: label4m)
                SecondaryValue(value: value4m)
            }
            .padding(.bottom, 80)
            ResultsTryAgainButton(primaryText: "try again")
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
    }
}

struct ResultsMenu_Previews: PreviewProvider {
    static var previews: some View {
        ResultsMenu(label1m: "dog", value1m: 78,
                    label2m: "beluga whale", value2m: 12,
                    label3m: "cow", value3m: 6,
                    label4m: "walrus", value4m: 4)
    }
}
