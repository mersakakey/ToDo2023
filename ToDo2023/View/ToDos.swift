//
//  ToDos.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2023/05/08.
//

import SwiftUI

/*
struct Todos: View {
    var body: some View {
        VStack {
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.pink)
                            .overlay(VStack {
                                Text("todos!")
                                    .foregroundColor(.white)

                            }.padding())
                    }
                    .frame(height: 400)
                    Spacer()
                }
    }
}
 
struct Todos_Previews: PreviewProvider {
    static var previews: some View {
        Todos()
    }
}
*/


struct Todos: View {
    @EnvironmentObject var todoModel: ToDoModel
    @State var selectedTab: TaskStatus
    @State private var isShowingSheet = false
    @State var title = "Todo"
    
    var filteredTaskList: [Task] {
        todoModel.taskList.filter {
            $0.status == selectedTab
        }
    }
    
    var body: some View {
        //NavigationView {
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
                }
                .cornerRadius(20)
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
            let task: Task = .init(name: "", description: "", status: selectedTab, kijitsu:"")
            TaskDetail(task: task)
        })
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        Todos(selectedTab: TaskStatus.WantToDo)
            .environmentObject(ToDoModel())
    }
}

