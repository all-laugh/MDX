//
//  ToolbarCommands.swift
//  MDX
//
//  Created by Xiao Quan on 1/16/22.
//

import SwiftUI

enum PreviewState {
	case textOnly, html, web
}

struct PreviewToolbarItem: ToolbarContent {
	@Binding var previewState: PreviewState
	
	var body: some ToolbarContent {
		ToolbarItem {
			HStack {
				Text("Preview Mode")
				Picker("Preview Mode",
					   selection: $previewState) {
					Image(systemName: "eye.slash")
						.tag(PreviewState.textOnly)
					Text("HTML")
						.tag(PreviewState.html)
					Text("Web")
						.tag(PreviewState.web)
				}
					   .pickerStyle(.segmented)
			}
			.font(.headline)
		}
	}
}
