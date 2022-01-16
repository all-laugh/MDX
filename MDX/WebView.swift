//
//  WebView.swift
//  MDX
//
//  Created by Xiao Quan on 1/15/22.
//

import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
	@AppStorage("styleSheet") var styleSheet: StyleSheets = .modest
	var html: String
	var htmlWithCSS: String {
		return """
			<html>
			<head>
			<link href="\(styleSheet).css" rel="stylesheet">
			</head>
			<body>
			\(html)
			</body>
			</html>
			"""
	}
	
	init (html: String) {
		self.html = html
	}
	
	func makeNSView(context: Context) -> WKWebView {
		return WKWebView()
	}
	
	func updateNSView(_ nsView: WKWebView, context: Context) {
		nsView.loadHTMLString(
			htmlWithCSS,
			baseURL: Bundle.main.resourceURL)
	}
}
