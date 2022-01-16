//
//  SettingsView.swift
//  MDX
//
//  Created by Xiao Quan on 1/15/22.
//

import SwiftUI

struct SettingsView: View {
	@AppStorage("editorFontSize") var editorFontSize: Int = 14
	
    var body: some View {
        Stepper(value: $editorFontSize,
				in: 8...50) {
			Text("Editor font size: \(editorFontSize)")
		}
				.frame(width: 260, height: 80)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
