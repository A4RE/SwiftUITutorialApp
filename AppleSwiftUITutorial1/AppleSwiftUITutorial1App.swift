//
//  AppleSwiftUITutorial1App.swift
//  AppleSwiftUITutorial1
//
//  Created by Андрей Коваленко on 11.09.2023.
//

import SwiftUI

@main
struct AppleSwiftUITutorial1App: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
        }
    }
}
