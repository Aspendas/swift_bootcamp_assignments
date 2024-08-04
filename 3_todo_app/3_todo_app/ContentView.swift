//
//  ContentView.swift
//  3_todo_app
//
//  Created by Umut Y. Çalışkan on 4.08.2024.
//

import SwiftUI


struct Task: Identifiable {
    let id = UUID()
    let name: String
    var isCompleted: Bool = false
}

struct ContentView: View {
    @State private var newTask: String = ""
    @State private var tasks: [Task] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Enter a task", text: $newTask)
                    .padding()
                    .border(Color.black)
                    
                Button(action: {
                    if !newTask.isEmpty {
                        tasks.append(Task(name: newTask))
                        newTask = ""
                    }
                }) {
                    Text("Add")
                        .padding()
                        .border(Color.black)
                }
            }
            .padding()
                    
            List {
                ForEach(tasks.indices, id: \.self) { index in
                    HStack {
                        Text(tasks[index].name)
                            .strikethrough(tasks[index].isCompleted, color: .black)
                        Spacer()
                    }
                    .onTapGesture {
                        tasks[index].isCompleted.toggle()
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
