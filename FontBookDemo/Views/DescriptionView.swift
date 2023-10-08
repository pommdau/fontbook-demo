//
//  DescriptionView.swift
//  FontBookDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/08.
//

import SwiftUI

struct DescriptionView: View {
    
    let fontModel: FontModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Description")
                .sectionTitle()
            
            Text(fontModel.ctFont.description ?? "")
                .lineLimit(nil)
            
            VStack(alignment: .leading) {
                Text("Designer")
                    .fontWeight(.semibold)
                Text(fontModel.ctFont.designer ?? "")
            }
            
            VStack(alignment: .leading) {
                Text("Manufacturer")
                    .fontWeight(.semibold)
                Text(fontModel.ctFont.manufacturer ?? "")
            }
        }
    }
}

#Preview {
    DescriptionView(fontModel: FontModel.sampleData.first!)
}
