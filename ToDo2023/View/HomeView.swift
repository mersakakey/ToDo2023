//
//  HomeView.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2023/05/08.
//

//メインのView

import SwiftUI
import RealmSwift

struct HomeView: View {
    @EnvironmentObject var todoModel: ToDoModel
    @StateObject var viewModel = ConcurrencyViewViewModel()
    @State var selectedTab: TaskStatus
    @State private var isShowingSheet = false
    @State private var isShowingChatSheet = false
    
    
    var body: some View {
        VStack{
            NavigationView{
                VStack(){
                    //Text(viewModel.designPhilosophy)
                    //.task {
                    //await viewModel.fetch()
                    //}　githubAPIの非同期処理のテストに使ったやつ(現在は未使用)
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
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.red)
                                    .opacity(0.8)
                                    .overlay(            Text("New")
                                        .font(.system(size: geometry.size.width*0.3, weight: .black, design: .default))
                                        .foregroundColor(.white)
                                    )
                            }.aspectRatio(1.5, contentMode: .fit)
                                .padding()
                        }
                        
                        Button(action: {
                            isShowingChatSheet = true
                        }) {
                            Image(decorative: "openaiicon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                            
                        }
                        
                    }.padding(.horizontal, 10)
                }
                .navigationTitle("ホーム画面")
            }
            .sheet(isPresented: $isShowingSheet, content: {
                let task: ToDoTask = .init(name: "", description: "", status: .ToDo, kijitsu:"")
                TaskDetail(task: task)
            })
            .sheet(isPresented: $isShowingChatSheet, content: {
                OpenAIView()
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
