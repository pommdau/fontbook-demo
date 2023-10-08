//
//  CTFont+traits.swift
//  FontBookDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/09.
//

import Foundation
import CoreText

/// refs: https://developer.apple.com/documentation/coretext/1509723-ctfontcopytraits
extension CTFont {
    
    // MARK: - General
    
    // key: https://developer.apple.com/documentation/coretext/ctfontdescriptor/font_traits
    private func load<T>(withKey key: CFString) -> T? {
        let traitsDictionary: [String: Any] = CTFontCopyTraits(self) as! Dictionary<String, Any>
        return traitsDictionary[key as String] as? T
    }
    
    // MARK: - Defines
    
    // The symbolic traits value from the font traits dictionary.
    var fontSymbolicTrait: UInt16? {
        let symbolicTraisNumber: NSNumber? = load(withKey: kCTFontSymbolicTrait)
        return symbolicTraisNumber?.uint16Value
    }
//    
//    // The normalized weight trait from the font traits dictionary.
//    let kCTFontWeightTrait: CFString
//    
//    // The normalized proportion (width condense or expand) trait from the font traits dictionary.
//    let kCTFontWidthTrait: CFString
//    
//    
//    // The normalized slant angle from the font traits dictionary.
//    let kCTFontSlantTrait: CFString
}
