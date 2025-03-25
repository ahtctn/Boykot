//
//  BrandViewModel.swift
//  Boykot
//
//  Created by Ahmet Ali ÇETİN on 25.03.2025.
//


import Foundation

class BrandViewModel: ObservableObject {
    @Published var brand: [BrandModel] = []
    @Published var isSearching = false
    @Published var searchText = ""
    @Published var selectedCategory: ProductType? = nil // Seçilen kategori
    
    init() {
        fetchBrandData()
    }
}

extension BrandViewModel {
    func fetchBrandData() {
        brand = BrandDataProvider.getHealthData()
    }
    
    func filterBrands() -> [BrandModel] {
        if searchText.isEmpty {
            return brand
        } else {
            return brand.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
}
