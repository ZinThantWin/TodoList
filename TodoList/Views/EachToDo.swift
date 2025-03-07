//
//  EachToDo.swift
//  TodoList
//
//  Created by Kinzo on 3/7/25.
//

import SwiftUI

struct EachToDo: View {
    @State var item : ToDoItem
    @EnvironmentObject var vm : ViewModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(item.isCompleted ? .green : .secondary)
                .contentTransition(.symbolEffect(.automatic))
            Text(item.text)
            Spacer()
        }
        .onTapGesture {
            vm.toggleItem(item)
        }
        .onChange(of: vm.items.first(where: { $0.id == item.id })?.isCompleted) { newValue in
                    if let newValue = newValue, item.isCompleted != newValue {
                        withAnimation {
                            item.isCompleted = newValue
                        }
                    }
                }
    }
}

#Preview {
    EachToDo(item: ToDoItem(text: "sample", isCompleted: false))
        .environmentObject(ViewModel())
}
