//
//  ToDos.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2023/05/08.
//

import SwiftUI

//ToDoリストのView

struct Todos: View {
    @EnvironmentObject var todoModel: ToDoModel
    @State var selectedTab: TaskStatus
    @State private var isShowingSheet = false
    @State var title = "Todo"
    
    var filteredTaskList: [ToDoTask] {
        todoModel.taskList.filter {
            $0.status == selectedTab
        }
    }
    
    var body: some View {
                List {
                    ForEach(filteredTaskList) { task in
                        NavigationLink(destination: TaskDetail(task: task)){
                            HStack {
                                Text(task.name)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.black))
                                
                                Text(task.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .padding(.leading, 6)
                                Text(task.kijitsu)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .padding(.leading, 6)
                            }
                        }
                    }
                    .listRowBackground(Color.gray.opacity(0.1))
                }
                .cornerRadius(20)
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .navigationTitle(title)
                .navigationBarItems(trailing: Button(action: {
                    isShowingSheet = true
                }) {
                    Text("+")
                        .font(.title2)
                        .foregroundColor(.black)
                        .frame(width: 30, height: 30)
                        .background(Color(.lightGray))
                        .cornerRadius(15)
                })
        
            
        
        .sheet(isPresented: $isShowingSheet, content: {
            let task: ToDoTask = .init(name: "", description: "", status: selectedTab, kijitsu:"")
            TaskDetail(task: task)
        })
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        Todos(selectedTab: TaskStatus.ToDo)
            .environmentObject(ToDoModel())
    }
}

