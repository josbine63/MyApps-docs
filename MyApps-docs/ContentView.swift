//
//  ContentView.swift
//  MyApps-docs
//
//  Created by Josblais on 2026-02-27.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: MyApps_docsDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(MyApps_docsDocument()))
}
