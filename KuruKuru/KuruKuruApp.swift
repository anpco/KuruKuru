//
//  KuruKuruApp.swift
//  KuruKuru
//
//  Created by Nguyen Duc Nhat on 12/06/2023.
//

import SwiftUI

@main
struct KuruKuruApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            #if os(macOS)
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Text("Kuru Kuru")
                            .font(.headline)
                    }
                }
            #endif
        }
        .windowStyle(.hiddenTitleBar)
    }
}
