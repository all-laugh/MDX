//
//  ContentView.swift
//  MDX
//
//  Created by Xiao Quan on 1/15/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: MDXDocument

    var body: some View {
		HSplitView {
			TextEditor(text: $document.text)
			WebView(html: document.html)
		}
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(MDXDocument()))
    }
}
