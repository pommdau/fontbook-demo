//
//  CTFontDescriptor+properties.swift
//  FontBookDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/08.
//

import Foundation
import CoreText

extension CTFontDescriptor {
    
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
    
//    var registrationScopeString: String? {
//        guard let registrationScope else {
//            return nil
//        }
//        switch registrationScope {
//        case .none:
//            return "NO"
//        case .process, .persistent, .session, .user:
//            return "YES"
//        @unknown default:
//            fatalError()
//        }
//    }
    
}
