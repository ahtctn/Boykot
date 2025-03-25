//
//  Size+View.swift
//  Boykot
//
//  Created by Ahmet Ali ÇETİN on 25.03.2025.
//

import Foundation
import SwiftUICore
import UIKit

let boundsUI = UIScreen.main.bounds

extension View {
    
    func dw(_ double: Double) -> Double {
        boundsUI.width * double
    }
    
    func dh(_ double: Double) -> Double {
         boundsUI.height * double
    }
}

extension View {
    func rotate(_ degrees: Double) -> some View {
        return self.rotationEffect(Angle(degrees: degrees))
    }
}
