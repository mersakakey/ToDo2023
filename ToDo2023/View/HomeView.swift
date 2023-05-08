//
//  HomeView.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2023/05/08.
//


import SwiftUI
import RealmSwift

struct HomeView: View {
    @EnvironmentObject var todoModel: ToDoModel
    @State var selectedTab: TaskStatus
    @State private var isShowingSheet = false
    
    
    var body: some View {
       // Text("test")
       VStack{
        NavigationView{
            VStack(){
                NavigationLink(destination: Todos(selectedTab: .ToDo)) {
                    ToDoButton(selectedTab:.ToDo)
                    }
                NavigationLink(destination: Todos(selectedTab: .WantToDo,title:"WantToDo")) {
                        ToDoButton(
                            selectedTab:.WantToDo,
                            backColor:Color.orange,title:"WantToDo")
                    }
                
            
            
                HStack{
                    NavigationLink(destination: Todos(selectedTab: .Done,title:"Done")) {
                        DoneButton()
                            .padding()
                    }

                    Button(action: {
                        isShowingSheet = true
                    }) {
                        GeometryReader { geometry in

                            RoundedRectangle(cornerRadius: 40)
                                .fill(Color.red)
                                .opacity(0.8)
                                .overlay(            Text("New")
                                    .font(.system(size: geometry.size.width*0.3, weight: .black, design: .default))
                                    .foregroundColor(.white)
                                )
                        }.aspectRatio(2, contentMode: .fit)
                            .padding()
                    }
                    
                }
         }
            .navigationTitle("ホーム画面")
        }
        .sheet(isPresented: $isShowingSheet, content: {
            let task: Task = .init(name: "", description: "", status: .ToDo, kijitsu:"")
            TaskDetail(task: task)
        })
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedTab: TaskStatus.WantToDo)
            .environmentObject(ToDoModel())
    }
}
