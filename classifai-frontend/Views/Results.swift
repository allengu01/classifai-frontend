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
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                CircleImage(image: Image("Allen"))
                    .frame(width: geometry.size.width*0.6, height: geometry.size.width*0.6, alignment: .topLeading)
                    .padding(.top, geometry.size.height*0.09)
                    .padding(.bottom, geometry.size.height*0.05)
                VStack(alignment: .center, spacing: 5) {
                    HStack {
                        PrimaryLabel(label: modelData.label1)
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 2, height: 18)
                            .edgesIgnoringSafeArea(.horizontal)
                        PrimaryValue(value: modelData.value1)
                    }
                    .padding(.top, 25)
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 50, height: 1)
                        .edgesIgnoringSafeArea(.vertical)
                        .padding(.bottom, 25)
                    HStack (spacing: 80){
                        VStack (alignment: .leading, spacing: 10) {
                            SecondaryLabel(label: modelData.label2)
                            SecondaryLabel(label: modelData.label3)
                            SecondaryLabel(label: modelData.label4)
                        }
                        VStack (alignment: .trailing, spacing: 15){
                            SecondaryValue(value: modelData.value2)
                            SecondaryValue(value: modelData.value3)
                            SecondaryValue(value: modelData.value4)
                        }
                    }
                    Spacer()
                    ResultsTryAgainButton(primaryText: "try again")
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
            }
            .ignoresSafeArea()
        }
    }
}



struct Results_Previews: PreviewProvider {
    static var previews: some View {
        Results()
            .environmentObject(ModelData())
    }
}
