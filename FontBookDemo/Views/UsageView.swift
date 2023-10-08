//
//  UsageView.swift
//  FontBookDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/08.
//

import SwiftUI

struct UsageView: View {
    
    let fontModel: FontModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Usage")
                .sectionTitle()
                .padding(.top, 10)
            
            VStack(alignment: .leading) {
                Text("Copyright")
                    .fontWeight(.semibold)
                Text("\(fontModel.ctFont.copyright ?? "")")
            }
            VStack(alignment: .leading) {
                Text("Trademark")
                    .fontWeight(.semibold)
                Text("\(fontModel.ctFont.trademark ?? "(nil)")")
            }
            VStack(alignment: .leading) {
                Text("License")
                    .fontWeight(.semibold)
                Text("\(fontModel.ctFont.license ?? "(nil)")")
            }
            VStack(alignment: .leading) {
                Text("Embedding")
                    .fontWeight(.semibold)
                Text("❓")
            }
            VStack(alignment: .leading) {
                Text("Copy Protected")
                    .fontWeight(.semibold)
                Text("❓")
            }
        }
    }
}

#Preview {
    UsageView(fontModel: FontModel.sampleData.first!)
}
