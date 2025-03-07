//
//  AddToDo.swift
//  TodoList
//
//  Created by Kinzo on 3/7/25.
//

import SwiftUI

struct AddToDo: View {
    @EnvironmentObject var vm: ViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            textfield
            addButton
        }
    }
}

extension AddToDo {
     private var textfield: some View {
         TextField(" Add something..", text: $vm.newItemText)
             .frame(maxWidth: .infinity)
             .frame(height: 55)
             .background(.thinMaterial)
             .cornerRadius(5)
             .padding()
    }
    
    private var addButton: some View {
        Button(action: {
            vm.addItem(ToDoItem(text: vm.newItemText, isCompleted: false))
            vm.newItemText = ""
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Add")
        }
    }
}

#Preview {
    AddToDo().environmentObject(ViewModel())
}
