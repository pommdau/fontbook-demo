//
//  Home.swift
//  FontBookDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/08.
//

import SwiftUI

struct Home: View {
    
    @State var fontModels: [FontModel] = [
        .init(url: URL(filePath: "/Users/ikeh/Library/Fonts/NotoSansCJKjp-Regular_2.otf"))!
//        .init(url: URL(filePath: "/System/Library/Fonts/Apple Color Emoji.ttc"))!
    ]
    
//    @State var fontModels: [FontModel] = FontModel.sampleData
    
    var body: some View {
        VStack(alignment: .leading) {
            if let fontModel = fontModels.first {
                NameHeaderView(fontModel: fontModel)
                    .padding(.top)
                    .padding(.leading)
                ScrollView() {
                    VStack(alignment: .leading) {
                        Text("""
                        A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
                        a b c d e f g h i j k l m n o p q r s t u v w x y z
                        1 2 3 4 5 6 7 8 9 0
                        """)
                        .font(Font(fontModel.nsFontForPreview))
                        Divider()
                        DescriptionView(fontModel: fontModel)
                        Divider()
                        LanguagesView(fontModel: fontModel)
                        Divider()
                        IdentifierView(fontModel: fontModel)
                        Divider()
                        UsageView(fontModel: fontModel)
                        Divider()
                        DetailsView(fontModel: fontModel)
                        Divider()
                    }
                    .padding()
                }
            } else {
                Text("URL is invalid!")
            }
        }
        .textSelection(.enabled)
        .background(Color(nsColor: .textBackgroundColor))
    }
}

extension Home {
    
    func extractFontURL(in directory: URL) -> [URL] {
        guard let files = try? FileManager.default.contentsOfDirectory(
            at: directory,
            includingPropertiesForKeys: nil) else {
            return []
        }
        let extensions = ["otf", "ttf", "ttc"]
        return files.filter { extensions.contains($0.pathExtension) }
    }
    
    var fontDirectories: [URL] {
        guard
            let systemLibraryPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .systemDomainMask, false).first,
            let generalLibraryPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .localDomainMask, false).first,
            let userLibraryPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first
        else {
            return []
        }
        
        return [systemLibraryPath, generalLibraryPath, userLibraryPath]
            .map { URL(filePath: $0) }
            .map { $0.appendingPathComponent("Fonts") }
    }
}

extension View {
    func sectionTitle() -> some View {
        self
            .font(.title3)
            .bold()
            .foregroundStyle(.secondary)
    }
    
}

#Preview {
//    ContentView()
    Home()
        .frame(width: 600, height: 2000)
}
