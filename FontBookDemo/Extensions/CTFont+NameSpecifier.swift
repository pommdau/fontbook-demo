//
//  CTFont+NameSpecifier.swift
//  FontBookDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/08.
//

import Foundation
import CoreText

extension CTFont {
    
    // MARK: - General
    
    private func load(withKey key: CFString, language: CFString? = nil) -> String? {
//        CTFontCopyName(self, key) as? String        
        if let language {
            var languageUnmanaged: Unmanaged<CFString>? = Unmanaged.passRetained(language)
            return CTFontCopyLocalizedName(self, key, &languageUnmanaged) as? String
        }
        return CTFontCopyLocalizedName(self, key, nil) as? String  // nilを設定した場合システム言語で取得されるよう
    }
    
    // MARK: - Defines
        
    var copyright: String? {
        load(withKey: kCTFontDesignerNameKey)
    }
    
    var family: String? {
        load(withKey: kCTFontFamilyNameKey)
    }
    
    var subFamily: String? {
        load(withKey: kCTFontSubFamilyNameKey)
    }
    
    var style: String? {
        load(withKey: kCTFontStyleNameKey)
    }
    
    var unique: String? {
        load(withKey: kCTFontUniqueNameKey)
    }
    
    var fullName: String? {
        load(withKey: kCTFontFullNameKey)
    }
    
    var version: String? {
        load(withKey: kCTFontVersionNameKey)
    }
    
    var postScriptName: String? {
        load(withKey: kCTFontPostScriptNameKey)
    }
    
    var trademark: String? {
        load(withKey: kCTFontTrademarkNameKey)
    }
    
    var manufacturer: String? {
        load(withKey: kCTFontManufacturerNameKey)
    }
    
    var designer: String? {
        load(withKey: kCTFontDesignerNameKey)
    }
    
    var description: String? {
        load(withKey: kCTFontDescriptionNameKey)
    }
    
    var vendorURL: String? {
        load(withKey: kCTFontVendorURLNameKey)
    }
    
    var designerURL: String? {
        load(withKey: kCTFontDesignerURLNameKey)
    }
    
    var license: String? {
        load(withKey: kCTFontLicenseNameKey)
    }
    
    var licenseURL: String? {
        load(withKey: kCTFontLicenseURLNameKey)
    }
    
    var sampleText: String? {
        load(withKey: kCTFontSampleTextNameKey)
    }
    
    var postScriptCID: String? {
        load(withKey: kCTFontPostScriptCIDNameKey)
    }
    
}
