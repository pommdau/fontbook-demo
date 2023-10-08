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
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            if let fontModel = fontModels.first {
                NameHeaderView(fontModel: fontModel)
                    .padding(.top)
                    .padding(.leading)
                ScrollView() {
                    VStack(alignment: .leading) {
//                        DescriptionView(fontModel: fontModel)
//                        Divider()
//                        LanguagesView(fontModel: fontModel)
//                        Divider()
//                        IdentifierView(fontModel: fontModel)
//                        UsageView(fontModel: fontModel)
//                        Divider()
                        DetailsView(fontModel: fontModel)
                        Divider()
                    }
                    .padding()
                }
            } else {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
        }
//        .padding()
        .background(Color(nsColor: .textBackgroundColor))
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
                .sectionTitle()
                .padding(.top, 10)
            
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
                    .fontWeight(.semibold)
                Text("\(languagesString)")
            }
            
            VStack(alignment: .leading) {
                Text("スクリプト")
                    .fontWeight(.semibold)
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
                Text("❓")
            }
            
            VStack(alignment: .leading) {
                Text("Active")
                    .fontWeight(.semibold)
                Text(fontModel.ctFontDescriptor.registrationScopeString ?? "")
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
        .frame(width: 600, height: 700)
}
