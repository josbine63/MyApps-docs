//
//  MyApps_docsApp.swift
//  MyApps-docs
//
//  Created by Josblais on 2026-02-27.
//

import SwiftUI

@main
struct MyApps_docsApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: MyApps_docsDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
