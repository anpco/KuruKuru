//
//  QLImage.swift
//  KuruKuru
//
//  Created by Nguyen Duc Nhat on 14/06/2023.
//

import SwiftUI
import Quartz

#if os(macOS)
struct QLImage: NSViewRepresentable {
    private let name: String

    init(_ name: String) {
        self.name = name
    }
    
    func makeNSView(context: NSViewRepresentableContext<QLImage>) -> QLPreviewView {
        guard let url = Bundle.main.url(forResource: name, withExtension: "gif")
        else {
            logger.log("Cannot get image \(name)")
            return QLPreviewView()
        }
        
        logger.log("\(name) is loaded successfully")
        
        let preview = QLPreviewView(frame: .zero, style: .normal)
        preview?.autostarts = true
        preview?.previewItem = url as QLPreviewItem
        
        return preview ?? QLPreviewView()
    }
    
    func updateNSView(_ nsView: QLPreviewView, context: NSViewRepresentableContext<QLImage>) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "gif")
        else {
            logger.log("Cannot get image \(name)")
            return
        }
        nsView.previewItem = url as QLPreviewItem
    }
    
    typealias NSViewType = QLPreviewView
}
#else
#endif

#Preview {
    QLImage("hertaa1")
        .frame(width: 500, height: 500)
}
