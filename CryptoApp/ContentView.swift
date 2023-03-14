//
//  ContentView.swift
//  CryptoApp
//
//  Created by Elodie Cari on 3/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                Text("accent")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
