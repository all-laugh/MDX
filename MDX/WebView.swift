//
//  WebView.swift
//  MDX
//
//  Created by Xiao Quan on 1/15/22.
//

import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
	var html: String
	
	init (html: String) {
		self.html = html
	}
	
	func makeNSView(context: Context) -> WKWebView {
		return WKWebView()
	}
	
	func updateNSView(_ nsView: WKWebView, context: Context) {
		nsView.loadHTMLString(
			html,
			baseURL: Bundle.main.resourceURL)
	}
}
