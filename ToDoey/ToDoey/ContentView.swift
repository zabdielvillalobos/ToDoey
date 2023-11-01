// ContentView.swift
//  ToDoey
//
// Created by Zabdiel Villalobos on 10/26/23.

import SwiftUI

struct ContentView: View {
    struct TodoItem: Identifiable {
        var id = UUID()
        var title: String
        var isCompleted: Bool = false
    }
    
    @State private var todos: [TodoItem] = []
    @State private var newTodoTitle: String = ""
    
    var body: some View {
        VStack {
            Text("ToDoey")
                .font(.largeTitle)
                .bold()
            
            TextField("Enter a task", text: $newTodoTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Add Todo") {
                if !newTodoTitle.isEmpty {
                    todos.append(TodoItem(title: newTodoTitle))
                    newTodoTitle = ""
                }
            }
            
            List {
                ForEach(todos) { todo in
                    TodoView(todo: todo)
                }
            }
        }
    }
}

struct TodoView: View {
    @State var todo: ContentView.TodoItem
    
    var body: some View {
        Button(action: {
            todo.isCompleted.toggle()
        }) {
            HStack {
                if todo.isCompleted {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.blue)
                } else {
                    Image(systemName: "circle")
                        .foregroundColor(.gray)
                }
                Text(todo.title)
                    .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    ContentView()
}
