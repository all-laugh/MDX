//
//  ContentView.swift
//  MDX
//
//  Created by Xiao Quan on 1/15/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: MDXDocument
	@State var previewState: PreviewState = .web
	@AppStorage("editorFontSize") var editorFontSize = 14

    var body: some View {
		HSplitView {
			TextEditor(text: $document.text)
				.font(.system(size: CGFloat(editorFontSize)))
				.frame(minWidth: 200)
			if previewState == .web {
				WebView(html: document.html)
					.frame(minWidth: 200)
			} else if previewState == .html {
				ScrollView {
					Text(document.html)
						.font(.system(size: CGFloat(editorFontSize)))
						.frame(minWidth: 200)
						.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
						.padding()
						.textSelection(.enabled)
				}
			}
		}
		.frame(minWidth: 500, idealWidth: 1000, maxWidth: .infinity,
			   minHeight: 300, idealHeight: 800, maxHeight: .infinity)
		.toolbar {
			PreviewToolbarItem(previewState: $previewState)
		}
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(MDXDocument()))
    }
}
