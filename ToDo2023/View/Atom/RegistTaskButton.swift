//
//  RegistTaskButton.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2023/05/08.
//
//

import SwiftUI
import RealmSwift

struct RegistTaskButton: View {
    
    //デフォルトRealmの取得
    let realm = try! Realm()

    
    @Binding var todoList: [ToDoTask]
    let task: ToDoTask
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        Button(action: {
            todoList.append(task)

            try! realm.write{
                //データの追加
                realm.add(transformDB(task: task))
            }
            
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("登録")
                .font(.title3)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .frame(width: 100, height: 60)
                .background(Color(.cyan))
                .cornerRadius(50)
        })
        .padding(.trailing)
        .padding(.top)
    }
}


struct RegistTaskButton_Previews: PreviewProvider {
    static var previews: some View {
        RegistTaskButton(todoList: .constant(ToDoModel().taskList), task: .init(name: "追加タスク", description: "追加タスクの説明", status: .ToDo, kijitsu:""))
    }
}

func transformDB(task:ToDoTask) -> DB{
    
    let idString = task.id.uuidString
    let statusString :String
    
    switch task.status {
        case .ToDo:
            statusString = "ToDo"
        case .WantToDo :
            statusString = "Want"
        case .Done:
            statusString = "Done"
    }

    
    let after = DB(id:idString,name:task.name,DBdescription:task.description,status:statusString,kijitsu:task.kijitsu)
    
    
    return after
}
