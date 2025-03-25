//
//  ContentView.swift
//  Boykot
//
//  Created by Ahmet Ali ÇETİN on 25.03.2025.
//

import SwiftUI

struct BoykotView: View {
    @StateObject private var vm = BrandViewModel()
    
    let columns = [
        GridItem(.flexible(), spacing: -30),
        GridItem(.flexible(), spacing: -30)
    ]
    
    var body: some View {
        VStack(spacing: -50) {
            // Header
            Rectangle()
                .fill(Color.baseClr)
                .frame(width: dw(1), height: dh(0.15))
                .overlay {
                    headerImg
                }
                .ignoresSafeArea(.all)
            
            if vm.isSearching {
                VStack {
                    customSearchTextField
                    categoryButtons
                }
                Spacer().frame(height: 120)
            }
            
            
            
            // Grid View
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(filteredBrands, id: \.id) { brand in
                        BoykotCellView(model: brand)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
        }
    }

    // MARK: - Filtered Brands
    private var filteredBrands: [BrandModel] {
        let filteredBySearch = vm.searchText.isEmpty ? vm.brand : vm.brand.filter { $0.name.localizedCaseInsensitiveContains(vm.searchText) }
        
        // Eğer bir kategori seçilmişse, sadece o kategoriye ait markaları göster
        if let category = vm.selectedCategory {
            return filteredBySearch.filter { $0.productType == category }
        }
        
        // Aksi takdirde tüm markaları göster
        return filteredBySearch
    }
}

#Preview {
    BoykotView()
}

// MARK: - UI Components
extension BoykotView {
    private var headerImg: some View {
        VStack {
            Spacer()
            HStack {
                Image("boykot")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dw(0.4278), height: dw(0.0839))
                Spacer()
                searchButton
            }
            .padding([.horizontal, .bottom], 20)
        }
    }
    
    private var searchButton: some View {
        Button {
            withAnimation {
                vm.isSearching.toggle()
            }
        } label: {
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: dw(0.07), height: dw(0.07))
                .foregroundStyle(Color.white)
        }
    }
    
    private var customSearchTextField: some View {
        TextField("Arama...", text: $vm.searchText)
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
            .background(Color.white.opacity(0.9))
            .cornerRadius(10)
            .shadow(radius: 5)
            .overlay(
                HStack {
                    Spacer()
                    Button {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            vm.isSearching.toggle()
                            vm.searchText = "" // Temizle
                            vm.selectedCategory = nil
                        }
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .padding(10)
                    }
                }
            )
            .padding([.leading, .trailing], 16)
            .transition(.move(edge: .top))
            .animation(.easeInOut(duration: 0.1), value: vm.isSearching) // Animasyon süresi 0.1 saniye
    }
    // MARK: - Category Buttons
    private var categoryButtons: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(ProductType.allCases, id: \.self) { category in
                    Button {
                        withAnimation {
                            if vm.selectedCategory == category {
                                vm.selectedCategory = nil // Aynı kategoriye tıklanırsa, kategoriyi kaldır
                            } else {
                                vm.selectedCategory = category
                            }
                        }
                    } label: {
                        HStack {
                            // Kategori ikonu
                            Image(systemName: category.iconName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: dw(0.05), height: dw(0.05))
                                .foregroundStyle(vm.selectedCategory == category ? .white : Color.baseClr)

                            // Kategori adı
                            Text(category.displayName)
                                .font(.footnote)
                                .foregroundColor(vm.selectedCategory == category ? .white : .black)
                                .frame(width: nil, height: 40) // Kategori adı
                        }
                        .padding(.horizontal, 20)
                        .background(vm.selectedCategory == category ? Color.baseClr : Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .frame(height: 40) // Sabit yükseklik
                    }
                    
                }
            }
            .padding([.leading, .trailing], 16)
        }
    }

}

