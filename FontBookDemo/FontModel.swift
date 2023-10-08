//
//  FontModel.swift
//  FontBookDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/08.
//

import AppKit

class FontModel {
    let uuid = UUID()
    let nsFont: NSFont
    let ctFont: CTFont
    let ctFontDescriptor: CTFontDescriptor
    
    var nsFontDescriptor: NSFontDescriptor {
        nsFont.fontDescriptor
    }
    
    init?(url: URL) {
        guard
            let data = try? Data(contentsOf: url) as NSData,
            let cgDataProvider = CGDataProvider(data: data),
            let cgFont = CGFont(cgDataProvider),
            let fontName = cgFont.postScriptName as String?,
            let nsFont = NSFont(name: fontName, size: 12)
        else {
            return nil
        }
        self.nsFont = nsFont
        self.ctFont = nsFont as CTFont
        self.ctFontDescriptor = CTFontCopyFontDescriptor(ctFont)
    }
}

extension FontModel: Identifiable {
    var id: String {
        uuid.uuidString
    }
    
}
