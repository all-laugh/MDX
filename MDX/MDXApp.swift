//
//  MDXApp.swift
//  MDX
//
//  Created by Xiao Quan on 1/15/22.
//

import SwiftUI

@main
struct MDXApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: MDXDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
