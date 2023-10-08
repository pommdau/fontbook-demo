//
//  CTFontDescriptor+attribute.swift
//  FontBookDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/08.
//

import Foundation
import CoreText

extension CTFontDescriptor {
    
    // MARK: - Utils
    
    private func loadAttribute<T>(withKey key: CFString) -> T? {
        CTFontDescriptorCopyAttribute(self, key) as? T
    }
    /*
     private func loadAttribute<T>(withKey key: CFString) -> T? {
     let languageString = "jp"
     let languageCFString = languageString as CFString
     var languageUnmanaged: Unmanaged<CFString>? = Unmanaged.passRetained(languageCFString)
     let result = CTFontDescriptorCopyLocalizedAttribute(self, key, &languageUnmanaged) as? T
     
     return result
     }
     */
}


// MARK: - Defines
/// refs: [Font Attributes](https://developer.apple.com/documentation/coretext/ctfontdescriptor/font_attributes)
/// GitHub Copilotで書き出しており、すべての動作はチェックしていないので、動かないものがある可能性アリ

extension CTFontDescriptor {
    
    // The font URL from the font descriptor.
    var url: URL? {
        loadAttribute(withKey: kCTFontURLAttribute)
    }
    
    // The PostScript name from the font descriptor.
    var postScriptName: String? {
        loadAttribute(withKey: kCTFontNameAttribute)
    }
    
    // The name used to display the font.
    var displayName: String? {
        loadAttribute(withKey: kCTFontDisplayNameAttribute)
    }
    
    // The font family name from the font descriptor.
    var familyName: String? {
        loadAttribute(withKey: kCTFontFamilyNameAttribute)
    }
    
    // The style name of the font.
    var styleName: String? {
        loadAttribute(withKey: kCTFontStyleNameAttribute)
    }
    
    // The dictionary of font traits for stylistic information.
    var traits: CFDictionary? {
        loadAttribute(withKey: kCTFontTraitsAttribute)
    }
    
    // The dictionary of font variation.
    var variation: CFDictionary? {
        loadAttribute(withKey: kCTFontVariationAttribute)
    }
    
    // The font point size.
    var size: CGFloat? {
        loadAttribute(withKey: kCTFontSizeAttribute)
    }
    
    // The font transformation matrix when creating a font.
    var matrix: CGAffineTransform? {
        loadAttribute(withKey: kCTFontMatrixAttribute)
    }
    
    // The cascade list used for a font reference.
    var cascadeList: CFArray? {
        loadAttribute(withKey: kCTFontCascadeListAttribute)
    }
    
    // The Unicode character coverage set for a font reference.
    var characterSet: CFCharacterSet? {
        loadAttribute(withKey: kCTFontCharacterSetAttribute)
    }
    
    // A list of covered languages for a font reference.
    var languages: Array<String>? {
        loadAttribute(withKey: kCTFontLanguagesAttribute)
    }
    
    // The baseline adjustment for a font reference.
    var baselineAdjust: CGFloat? {
        loadAttribute(withKey: kCTFontBaselineAdjustAttribute)
    }
    
    // The Macintosh encodings for a font reference.
    var macintoshEncodings: CFArray? {
        loadAttribute(withKey: kCTFontMacintoshEncodingsAttribute)
    }
    
    // The font features for a font reference.
    var fontFeatures: CFArray? {
        loadAttribute(withKey: kCTFontFeaturesAttribute)
    }
    
    // The font features settings for a font reference.
    var fontFeatureSettings: CFArray? {
        loadAttribute(withKey: kCTFontFeatureSettingsAttribute)
    }
    
    // A fixed advance to be used for a font reference.
    var fixedAdvance: CGFloat? {
        loadAttribute(withKey: kCTFontFixedAdvanceAttribute)
    }
    
    // The orientation for the glyphs of the font.
    var orientation: Int? {
        loadAttribute(withKey: kCTFontOrientationAttribute)
    }
    
    // The recognized format of the font.
    var format: CTFontFormat? {
        guard let rawValue: UInt32 = loadAttribute(withKey: kCTFontFormatAttribute) else {
            return nil
        }
        return CTFontFormat(rawValue: rawValue)
    }
    
    var formatString: String? {
        guard let format else {
            return nil
        }
        
        switch format {
        case .unrecognized:
            return "Unrecognized"
        case .openTypePostScript:
            return "OpenType PostScript"
        case .openTypeTrueType:
            return "OpenType TrueType"
        case .trueType:
            return "TrueType"
        case .postScript:
            return "PostScript"
        case .bitmap:
            return "Bitmap"
        @unknown default:
            return "Unrecognized"
        }
    }
    
    // The font descriptor's registration scope.
    var registrationScope: String? {
        loadAttribute(withKey: kCTFontRegistrationScopeAttribute)
    }
    
    // The font priority used by font descriptors when resolving duplicates and sorting match results.
    var priority: Int? {
        loadAttribute(withKey: kCTFontPriorityAttribute)
    }
    
    // The font enabled state.
    var enabled: Bool? {
        loadAttribute(withKey: kCTFontEnabledAttribute)
    }
    
    // The font downloadable state.
    var downloadable: Bool? {
        loadAttribute(withKey: kCTFontDownloadableAttribute)
    }
    
    // The download state.
    var downloaded: Bool? {
        loadAttribute(withKey: kCTFontDownloadedAttribute)
    }
}

