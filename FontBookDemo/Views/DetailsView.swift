//
//  DetailsView.swift
//  FontBookDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/08.
//

import SwiftUI

struct DetailsView: View {
    
    let fontModel: FontModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Details")
                .sectionTitle()
                .padding(.top, 10)
            
            VStack(alignment: .leading) {
                Text("Format")
                    .fontWeight(.semibold)
                Text(fontModel.ctFontDescriptor.formatString ?? "")
            }
            
            VStack(alignment: .leading) {
                Text("System Font")
                    .fontWeight(.semibold)
                Text(fontModel.isSystemFont ? "Yes" : "No")
            }
            
            VStack(alignment: .leading) {
                Text("Active")
                    .fontWeight(.semibold)
                Text("❓")
            }
            
            VStack(alignment: .leading) {
                Text("Duplicate")
                    .fontWeight(.semibold)
                Text("❓")
            }
            
            VStack(alignment: .leading) {
                Text("Glyph Count")
                    .fontWeight(.semibold)
                Text("\(CTFontGetGlyphCount(fontModel.ctFont))")
            }
            
            VStack(alignment: .leading) {
                Text("Location")
                    .fontWeight(.semibold)
                Text(fontModel.url.path)
            }
            
            VStack(alignment: .leading) {
                Text("Version")
                    .fontWeight(.semibold)
                Text(fontModel.ctFont.version ?? "")
            }
        }
    }
}

#Preview {
    DetailsView(fontModel: FontModel.sampleData.first!)
}
