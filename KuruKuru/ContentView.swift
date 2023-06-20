//
//  ContentView.swift
//  KuruKuru
//
//  Created by Nguyen Duc Nhat on 12/06/2023.
//

import SwiftUI

enum CurrentSquishingGIF {
    case hertaa1, hertaa2
}

struct ContentView: View {
    @AppStorage("") internal var isSquishingKuruKuru = 0
    @State internal var currentSquishingKuruKuruGIF = CurrentSquishingGIF.hertaa1
    
    var body: some View {
        VStack(spacing: 0) {
            if isSquishingKuruKuru > 0 {
                switch currentSquishingKuruKuruGIF {
                case .hertaa1:
                    QLImage("hertaa1")
                case .hertaa2:
                    QLImage("hertaa2")
                }
            }
            Divider()
                .padding(.bottom)
            SquishKuruKuruButton(squishKuruKuru)
                .padding([.bottom, .horizontal])
        }
        .padding(.top)
    }
    
    func squishKuruKuru() {
        logger.log("Squished Kuru Kuru")
        self.isSquishingKuruKuru += 1
    }
}

fileprivate struct SquishKuruKuruButton: View {
    let squishKuruKuru: () -> Void
    
    init(_ squishKuruKuru: @escaping () -> Void) {
        self.squishKuruKuru = squishKuruKuru
    }
    
    var body: some View {
        Button(
            "Squish Kuru Kuru",
            action: squishKuruKuru
        )
        .controlSize(.large)
    }
}

#Preview {
    ContentView()
}
