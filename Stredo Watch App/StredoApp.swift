//
//  StredoApp.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 22/05/23.
//

import SwiftUI

@main
struct Stredo_Watch_AppApp: App {
    @StateObject private var  stretchingManager = StretchingManager()
    @State private var path = NavigationPath()

    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                StartView(path: $path)
            }
            .environmentObject(stretchingManager)
        }
    }
}
