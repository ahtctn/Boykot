//
//  BrandModel.swift
//  Boykot
//
//  Created by Ahmet Ali ÇETİN on 25.03.2025.
//

import Foundation

struct BrandModel: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var image: String
    var productType: ProductType
}
