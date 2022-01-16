//
//  StyleSheets.swift
//  MDX
//
//  Created by Xiao Quan on 1/15/22.
//

import Foundation
import SwiftUI

enum StyleSheets: String, CaseIterable {
	case ulysses = "Ulysses"
	case solarizedDark = "Solarized Dark"
	case modest = "Modest"
	case github = "Github"
	
	var keystroke: KeyEquivalent {
		switch self {
			case .ulysses:
				return "1"
			case .solarizedDark:
				return "2"
			case .modest:
				return "3"
			case .github:
				return "4"
		}
	}
}
