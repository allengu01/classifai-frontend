//
//  PartialModal.swift
//  classifai-frontend
//
//  Created by Allen Gu on 7/4/21.
//

import SwiftUI

struct PartialModal<SheetContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    let sheetContent: () -> SheetContent

    func body(content: Content) -> some View {
        ZStack {
            content

            if isPresented {
                VStack {
                    Spacer()

                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                withAnimation(.easeInOut) {
                                    self.isPresented = false
                                }
                            }) {
                                Text("done")
                                    .padding(.top, 5)
                            }
                        }

                        sheetContent()
                    }
                    .padding()
                }
                .zIndex(.infinity)
                .transition(.move(edge: .bottom))
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

extension View {
    func partialModal<SheetContent: View>(
        isPresented: Binding<Bool>,
        sheetContent: @escaping () -> SheetContent
    ) -> some View {
        self.modifier(PartialModal(isPresented: isPresented, sheetContent: sheetContent))
    }
}
