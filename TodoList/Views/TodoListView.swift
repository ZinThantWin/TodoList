//
//  TodoListView.swift
//  TodoList
//
//  Created by Kinzo on 3/7/25.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var vm : ViewModel
    var body: some View {
        NavigationStack{
            VStack {
                if vm.items.isEmpty {
                    Text("No Todo List. Add one.")
                } else {
                    List {
                        ForEach(vm.items, id: \.id) { each in
                            EachToDo(item: each)
                        }
                        .onDelete { index in
                            vm.deleteItemAt(index)
                        }
                    }
                    
                    .listStyle(.plain)
                }
            }
            .navigationBarItems(leading: EditButton(),trailing: NavigationLink(destination: {
                AddToDo()
            }, label: {
                Image(systemName: "plus")
            }))
            .navigationTitle("Todo List 📝")
            .customNavigationBarStyle()
        }
    }
}

#Preview {
    NavigationStack {
        TodoListView()
            .environmentObject(ViewModel())
    }
}
