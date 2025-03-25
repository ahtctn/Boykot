//
//  ProductType.swift
//  Boykot
//
//  Created by Ahmet Ali ÇETİN on 25.03.2025.
//

import Foundation

enum ProductType: String, CaseIterable {
    case food_n_drink = "Food & Drink"
    case magazine = "Magazine"
    case mall = "Mall"
    case home_product = "Home Product"
    case energy = "Energy"
    case media = "Media"
    case bet = "Bet"
    case tourism = "Tourism"
    
    var displayName: String {
        switch self {
        case .food_n_drink: return "Gıda"
        case .magazine: return "Dergi"
        case .mall: return "AVM"
        case .home_product: return "Ev Ürünü"
        case .energy: return "Enerji"
        case .media: return "Medya"
        case .bet: return "Bahis"
        case .tourism: return "Turizm"
        }
    }
    
    // Kategorilere uygun ikon isimlerini döndür
    var iconName: String {
        switch self {
        case .food_n_drink: return "fork.knife.circle"
        case .magazine: return "books.vertical"
        case .mall: return "building.2.crop.circle"
        case .home_product: return "sofa.fill"
        case .energy: return "bolt.fill"
        case .media: return "camera.aperture"
        case .bet: return "dice"
        case .tourism: return "bus"
        }
    }
}
