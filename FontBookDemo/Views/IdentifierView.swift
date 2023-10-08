//
//  IdentifierView.swift
//  FontBookDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/08.
//

import SwiftUI

struct IdentifierView: View {
    
    let fontModel: FontModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Identifiers")
                .sectionTitle()
                .padding(.top, 10)
            
            VStack(alignment: .leading) {
                Text("Family Name")
                    .fontWeight(.semibold)
                Text("\(fontModel.ctFont.family ?? "")")
            }
            VStack(alignment: .leading) {
                Text("Style Name")
                    .fontWeight(.semibold)
                Text("\(fontModel.ctFont.style ?? "(nil)")")
            }
            VStack(alignment: .leading) {
                Text("PostScript Name")
                    .fontWeight(.semibold)
                Text("\(fontModel.ctFont.postScriptName ?? "(nil)")")
            }
            VStack(alignment: .leading) {
                Text("Unique Name")
                    .fontWeight(.semibold)
                Text("\(fontModel.ctFont.unique ?? "(nil)")")
            }
        }
    }
}

#Preview {
    IdentifierView(fontModel: FontModel.sampleData.first!)
}
