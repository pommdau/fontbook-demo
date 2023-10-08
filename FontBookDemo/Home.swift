//
//  Home.swift
//  FontBookDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/08.
//

import SwiftUI

struct Home: View {
    
    @State var fontModels: [FontModel] = [
        .init(url: URL(filePath: "/Users/ikeh/Library/Fonts/NotoSansCJKjp-Regular.otf"))!
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            if let fontModel = fontModels.first {
//                NameHeaderView(fontModel: fontModel)
//                DescriptionView(fontModel: fontModel)
//                Divider()
//                LanguagesView(fontModel: fontModel)
//                Divider()
//                IdentifierView(fontModel: fontModel)
//                UsageView(fontModel: fontModel)
//                Divider()
                DetailsView(fontModel: fontModel)
                Divider()
            } else {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
        }
        .padding()
    }
}

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

struct DescriptionView: View {
    
    let fontModel: FontModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Description")
                .font(.title3)
                .bold()
                .foregroundStyle(.secondary)
                .padding(.top, 10)
            
            Text(fontModel.ctFont.description ?? "")
                .lineLimit(nil)
            
            VStack(alignment: .leading) {
                Text("Designer")
                    .bold()
                Text(fontModel.ctFont.designer ?? "")
            }
            
            VStack(alignment: .leading) {
                Text("Manufacturer")
                    .bold()
                Text(fontModel.ctFont.manufacturer ?? "")
            }
        }
    }
}


struct LanguagesView: View {
    
    let fontModel: FontModel
    
    var languagesString: String {
        guard let languages = fontModel.ctFontDescriptor.languages else {
            return ""
        }
        return languages.joined(separator: "・")
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Language Support")
                .font(.title3)
                .bold()
                .foregroundStyle(.secondary)
                .padding(.top, 10)
            
            VStack(alignment: .leading) {
                Text("言語:")
                    .bold()
                Text("\(languagesString)")
            }
            
            VStack(alignment: .leading) {
                Text("スクリプト")
                    .bold()
                Text("(I don't know how to get it.)")
            }
        }
    }
}

struct IdentifierView: View {
    
    let fontModel: FontModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Identifiers")
                .font(.title3)
                .bold()
                .foregroundStyle(.secondary)
                .padding(.top, 10)
            
            VStack(alignment: .leading) {
                Text("Family Name")
                    .bold()
                Text("\(fontModel.ctFont.family ?? "")")
            }
            VStack(alignment: .leading) {
                Text("Style Name")
                    .bold()
                Text("\(fontModel.ctFont.style ?? "(nil)")")
            }
            VStack(alignment: .leading) {
                Text("PostScript Name")
                    .bold()
                Text("\(fontModel.ctFont.postScriptName ?? "(nil)")")
            }
            VStack(alignment: .leading) {
                Text("Unique Name")
                    .bold()
                Text("\(fontModel.ctFont.unique ?? "(nil)")")
            }
        }
    }
}

struct UsageView: View {
    
    let fontModel: FontModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Usage")
                .font(.title3)
                .bold()
                .foregroundStyle(.secondary)
                .padding(.top, 10)
            
            VStack(alignment: .leading) {
                Text("Copyright")
                    .bold()
                Text("\(fontModel.ctFont.copyright ?? "")")
            }
            VStack(alignment: .leading) {
                Text("Trademark")
                    .bold()
                Text("\(fontModel.ctFont.trademark ?? "(nil)")")
            }
            VStack(alignment: .leading) {
                Text("License")
                    .bold()
                Text("\(fontModel.ctFont.license ?? "(nil)")")
            }
            VStack(alignment: .leading) {
                Text("Embedding")
                    .bold()
                Text("❓")
            }
            VStack(alignment: .leading) {
                Text("Copy Protected")
                    .bold()
                Text("❓")
            }
        }
    }
}

struct DetailsView: View {
    
    let fontModel: FontModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Details")
                .font(.title3)
                .bold()
                .foregroundStyle(.secondary)
                .padding(.top, 10)
            
            VStack(alignment: .leading) {
                Text("Format")
                    .bold()
                Text("❓")
            }
            
            VStack(alignment: .leading) {
                Text("System Font")
                    .bold()
                Text("❓")
            }
            
            VStack(alignment: .leading) {
                Text("Active")
                    .bold()
                Text("❓")
            }
            
            VStack(alignment: .leading) {
                Text("Duplicate")
                    .bold()
                Text("❓")
            }
            
            VStack(alignment: .leading) {
                Text("Glyph Count")
                    .bold()
                Text("❓")
            }
            
            VStack(alignment: .leading) {
                Text("Location")
                    .bold()
                Text(fontModel.ctFontDescriptor.url?.path ?? "")
            }
            
            VStack(alignment: .leading) {
                Text("Version")
                    .bold()
                Text(fontModel.ctFont.version ?? "")
            }            
        }
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


#Preview {
//    ContentView()
    Home()
        .frame(width: 600, height: 700)
}
