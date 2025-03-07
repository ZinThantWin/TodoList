//
//  TodoListApp.swift
//  TodoList
//
//  Created by Kinzo on 3/7/25.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var vm = ViewModel()
    var body: some Scene {
        WindowGroup {
            TodoListView()
                .environmentObject(vm)
        }
    }
}
