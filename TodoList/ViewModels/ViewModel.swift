//
//  ViewModel.swift
//  TodoList
//
//  Created by Kinzo on 3/7/25.
//

import Foundation

final class ViewModel : ObservableObject {
    @Published var newItemText: String = ""
    
    @Published var items: [ToDoItem] = [] {
        didSet {
            saveItems()
        }
    }
    
    private let userDefaults = UserDefaults.standard
    private let key: String = "items"
    
    init() {
        getItems()
    }
    
    func addItem(_ newItem : ToDoItem){
        items.append(newItem)
    }
    
    func toggleItem(_ newItem : ToDoItem){
        
        guard !items.isEmpty else{
            return
        }
        
        if let index = items.firstIndex(of: newItem){
            items[index].isCompleted.toggle()
        }
    }
    
    func deleteItemAt(_ offsets : IndexSet){
        guard !items.isEmpty else{
            return
        }
        items.remove(atOffsets: offsets)
    }
    
    func deleteItem(_ newItem : ToDoItem){
        
        guard !items.isEmpty else{
            return
        }
        
        if let index = items.firstIndex(of: newItem){
            items.remove(at: index)
        }
        
    }
    
    func getItems() {
        let data = userDefaults.data(forKey: key)
        guard let data = data, let list = try? JSONDecoder().decode([ToDoItem].self, from: data) else{
            print("no saved data found!")
            return
        }
        self.items = list
    }
    
    func saveItems() -> Void {
        if let data = try? JSONEncoder().encode(items) {
            userDefaults.set(data, forKey: key)
        }
    }
}
