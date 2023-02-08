//
//  ContentView.swift
//  CustomNavbar
//
//  Created by Bror Brurberg on 08/02/2023.
//

import SwiftUI

struct Tab: Identifiable {
    let id = UUID()
    let view: AnyView
    let name: String
    let systemImage: String
}

struct ContentView: View {
    
    @State private var tabs: [Tab]
    
    @State private var selectedTabs: [Tab] = []
    @State private var selectedTab: Tab
    
    @State private var path = NavigationPath()
    
    init() {
        let tabs: [Tab] = [
            .init(view: AnyView(NewsList()), name: "News", systemImage: "list.dash"),
            .init(view: AnyView(Profile()), name: "Profile", systemImage: "person"),
            .init(view: AnyView(Settings()), name: "Settings", systemImage: "gear")
        ]
        
        self._tabs = State(initialValue: tabs)
        self._selectedTabs = State(initialValue: [tabs[0], tabs[1]])
        self._selectedTab = State(initialValue: tabs[0])
    }
    
    var body: some View {
        NavigationView {
            NavigationStack(path: $path) {
                selectedTab.view
                    .navigationDestination(for: Article.self) { article in
                        HStack {
                            Text(article.title)
                            Text(article.subtitle).font(.subheadline)
                        }
                    }
                    
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    ForEach(selectedTabs, id: \.id) { tabbarTab in
                        Label(tabbarTab.name, systemImage: tabbarTab.systemImage)
                            .foregroundColor(tabbarTab.id == selectedTab.id ? .blue : .black)
                            .onTapGesture {
                                selectedTab = tabbarTab
                                path.removeLast(path.count)
                            }
                            .contextMenu {
                                ForEach(tabs) { tab in
                                    Button(tab.name) {
                                        let index = selectedTabs.firstIndex(where: { selectedTab in
                                            selectedTab.id == tabbarTab.id
                                        })
                                        if let index {
                                            selectedTabs.remove(at: index)
                                            selectedTabs.insert(tab, at: index)
                                            selectedTab = tab
                                        }
                                    }
                                }
                            }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
