//
//  BoykotCellView.swift
//  Boykot
//
//  Created by Ahmet Ali ÇETİN on 25.03.2025.
//



import SwiftUI

struct BoykotCellView: View {
    var model: BrandModel
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.baseClr)
            .frame(width: dw(0.4), height: dw(0.4), alignment: .center)
            .overlay {
                VStack {
                    Text(model.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.3))
                        .frame(width: dw(0.3), height: dw(0.1))
                        .overlay {
                            Text(model.productType.displayName)
                                .foregroundStyle(.white)
                        }
                }
            }
    }
}

#Preview {
    BoykotCellView(model: .init(name: "ÇTNSPORTS", description: "", image: "", productType: .bet))
}
