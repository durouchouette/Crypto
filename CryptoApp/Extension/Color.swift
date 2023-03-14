//
//  Color.swift
//  CryptoApp
//
//  Created by Elodie Cari on 3/9/23.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorScheme()
}

struct ColorScheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}
