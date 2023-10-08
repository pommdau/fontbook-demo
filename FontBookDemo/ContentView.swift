//
//  ContentView.swift
//  FontBookDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear() {
            print(fontDirectories)
        }
        .padding()
    }
}

extension ContentView {
    
    func extractFontURLs(in directory: URL) -> [URL] {
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
    ContentView()
}
