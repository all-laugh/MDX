//
//  MenuCommands.swift
//  MDX
//
//  Created by Xiao Quan on 1/15/22.
//

import SwiftUI

struct MenuCommands: Commands {
	@AppStorage("styleSheet") var styleSheet: StyleSheets = .modest
	
    var body: some Commands {
		CommandGroup (before: .help) {
			Button("Markdown Cheatsheet") {
				showCheatsheet()
			}
			.keyboardShortcut("/", modifiers: .command)
			
			Divider()
			
			ForEach(StyleSheets.allCases, id: \.self) { style in
				Button(style.rawValue) {
					styleSheet = style
				}
				.keyboardShortcut(style.keystroke, modifiers: .command)
			}
		}
    }
	
	func showCheatsheet() {
		let address = "https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet"
		guard let url = URL(string: address) else {
			fatalError("Invalid Cheatsheet URL")
		}
		
		NSWorkspace.shared.open(url)
	}
}
