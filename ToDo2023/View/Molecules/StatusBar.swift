//
//  StatusBar.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2023/05/08.
//
import SwiftUI

struct TaskStatusTabBar: View {
    @Binding var selectedTab: TaskStatus
    @Namespace var namespace
    
    var body: some View {
        HStack {
            ForEach(TaskStatus.allCases, id: \.self) { status in
                StatusTabButton(selectedButton: $selectedTab, selfButtonStatus: status, namespace: namespace)
            }
        }
        .frame(width: 300, height: 50)
        .background(Color(.lightGray))
        .cornerRadius(25)
        
    }
}

struct TaskStatusTabBar_Previews: PreviewProvider {
    static var previews: some View {
        TaskStatusTabBar(selectedTab: .constant(.WantToDo))
            .previewLayout(.fixed(width: 300, height: 50))
    }
}
