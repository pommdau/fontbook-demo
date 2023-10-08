//
//  FontModel.swift
//  FontBookDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/08.
//

import AppKit

class FontModel {
    let uuid = UUID()
    let url: URL
    let ctFont: CTFont
    let nsFont: NSFont
    let ctFontDescriptor: CTFontDescriptor
    
    var nsFontDescriptor: NSFontDescriptor {
        nsFont.fontDescriptor
    }
    
    init?(url: URL) {
        guard
            let data = try? Data(contentsOf: url) as NSData,
            let cgDataProvider = CGDataProvider(data: data),
            let cgFont = CGFont(cgDataProvider)
        else {
            return nil
        }
        self.url = url
        self.ctFont = CTFontCreateWithGraphicsFont(cgFont, 0, nil, nil)
        self.nsFont = ctFont as NSFont
        self.ctFontDescriptor = CTFontCopyFontDescriptor(ctFont)
    }
    
    var isSystemFont: Bool {
        guard let systemLibraryPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .systemDomainMask, false).first else {
            return false
        }
        return url.path.contains(systemLibraryPath)
    }
}

extension FontModel: Identifiable {
    var id: String {
        uuid.uuidString
    }
    
}
