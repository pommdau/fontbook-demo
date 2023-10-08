//
//  NameHeaderView.swift
//  FontBookDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/08.
//

import SwiftUI

struct NameHeaderView: View {
    
    let fontModel: FontModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(fontModel.ctFont.family ?? "")
                .font(.title2)
                .bold()
            Text(fontModel.ctFont.style ?? "")
                .font(.title3)
        }
    }
}

#Preview {
    NameHeaderView(fontModel: FontModel.sampleData.first!)
}
