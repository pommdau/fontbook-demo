//
//  LanguagesView.swift
//  FontBookDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/08.
//

import SwiftUI

struct LanguagesView: View {
    
    let fontModel: FontModel
    
    var languagesString: String {
        guard let languages = fontModel.ctFontDescriptor.languages else {
            return ""
        }
        return languages
            .sorted(by: { first, second in
                first < second
            })
            .joined(separator: "・")
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Language Support")
                .font(.title3)
                .bold()
                .foregroundStyle(.secondary)
                .padding(.top, 10)
            
            VStack(alignment: .leading) {
                Text("Designed For:")
                    .fontWeight(.semibold)
                Text("\(languagesString)")
            }
            
            VStack(alignment: .leading) {
                Text("Also Supported:")
                    .fontWeight(.semibold)
                Text("❓")
            }
            
            VStack(alignment: .leading) {
                Text("Scripts")
                    .fontWeight(.semibold)
                Text("❓")
            }
        }
    }
}

#Preview {
    LanguagesView(fontModel: FontModel.sampleData.first!)
}
