//
//  ContentView.swift
//  AppleSwiftUITutorial1
//
//  Created by Андрей Коваленко on 11.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .categories
    
    enum Tab {
        case categories
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.categories)
            GridView()
                .tabItem {
                    Label("All", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        .tint(.myCustomColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
