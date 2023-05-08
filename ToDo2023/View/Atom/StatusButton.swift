//
//  StatusButton.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2022/06/06.
//

import SwiftUI

struct StatusTabButton: View {
    
    @Binding var selectedButton: TaskStatus
    let selfButtonStatus: TaskStatus
    var namespace: Namespace.ID
    var title: String {
        switch selfButtonStatus {
        case .ToDo:
            return "ToDo"
        case .WantToDo:
            return "Want"
        case .Done:
            return "Done"
        }
    }
    var body: some View {
        
        ZStack {
            if selectedButton == selfButtonStatus {
                Capsule()
                    .fill(Color(.darkGray))
                    .frame(width: 100, height: 50)
                    .matchedGeometryEffect(id: "CustomButton", in: namespace)
                
            }
            Button(action: {
                withAnimation{
                    selectedButton = selfButtonStatus
                }
            }){
                Text(title)
                    .fontWeight(.heavy)
                    .frame(width: 100, height: 50)
                    .foregroundColor(selectedButton == selfButtonStatus ? .white : .gray)
                
            }
            .cornerRadius(25)
        }
        
    }
}

struct StatusTabButton_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        StatusTabButton(selectedButton: .constant(.WantToDo), selfButtonStatus: TaskStatus.WantToDo, namespace: namespace)
    }
}
