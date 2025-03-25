//
//  BrandDataProvider.swift
//  Boykot
//
//  Created by Ahmet Ali ÇETİN on 25.03.2025.
//


import SwiftUI

struct BrandDataProvider {
    static func getHealthData() -> [BrandModel] {
        return [
            BrandModel(name: "EspressoLab", description: "", image: "EspressoLab", productType: .food_n_drink),
            BrandModel(name: "D&R", description: "", image: "D&R", productType: .magazine),
            BrandModel(name: "İdefix", description: "", image: "İdefix", productType: .magazine),
            BrandModel(name: "Demirören\nAVM", description: "", image: "DemirörenAVM", productType: .mall),
            BrandModel(name: "Kilim Mobilya", description: "", image: "KilimMobilya", productType: .home_product),
            BrandModel(name: "Ülker", description: "", image: "Ülker", productType: .food_n_drink),
            BrandModel(name: "Türk Petrol", description: "", image: "TürkPetrol", productType: .energy),
            BrandModel(name: "Milangaz", description: "", image: "Milangaz", productType: .energy),
            BrandModel(name: "Likitgaz", description: "", image: "Likitgaz", productType: .energy),
            BrandModel(name: "TRT", description: "", image: "TRT", productType: .media),
            BrandModel(name: "TGRT", description: "", image: "TGRT", productType: .media),
            BrandModel(name: "İhlas\nEv Aletleri", description: "", image: "İhlasEvAletleri", productType: .home_product),
            BrandModel(name: "Turkuaz Yayınevi", description: "", image: "TurkuazYayınevi", productType: .magazine),
            BrandModel(name: "Milli Piyango", description: "", image: "MilliPiyango", productType: .bet),
            BrandModel(name: "misli.com", description: "", image: "misli.com", productType: .bet),
            BrandModel(name: "iddia.com", description: "", image: "iddia.com", productType: .bet),
            BrandModel(name: "ETS Tur", description: "", image: "ETSTur", productType: .tourism)
        ]
    }
}
