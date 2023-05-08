//
//  toDoApp.swift
//  Shared
//
//  Created by Takeru Sakakibara on 2022/05/16.
//

import SwiftUI

@main
struct toDoApp: App {
    @StateObject private var todoModel = ToDoModel()
    var body: some Scene {
        WindowGroup{
            HomeView(selectedTab: TaskStatus.WantToDo)
                .environmentObject(todoModel)
        }
    }
}
