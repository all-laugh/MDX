//
//  MDXDocument.swift
//  MDX
//
//  Created by Xiao Quan on 1/15/22.
//

import SwiftUI
import UniformTypeIdentifiers
import MarkdownKit

extension UTType {
    static var markdownText: UTType {
        UTType(importedAs: "net.daringfireball.markdown")
    }
}

struct MDXDocument: FileDocument {
    var text: String
	var html: String {
		let markdown = MarkdownParser.standard.parse(text)
		return HtmlGenerator.standard.generate(doc: markdown)
	}

    init(text: String = "# MDX") {
        self.text = text
    }

    static var readableContentTypes: [UTType] { [.markdownText] }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        text = string
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = text.data(using: .utf8)!
        return .init(regularFileWithContents: data)
    }
}
