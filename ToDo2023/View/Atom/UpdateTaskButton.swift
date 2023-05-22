//
//  UpdateTaskButton.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2022/06/06.
//

import SwiftUI
import RealmSwift

struct UpdateTaskButton: View {
    @Binding var beforeValueTask: ToDoTask
    @Environment(\.presentationMode) var presentationMode
    let afterValueTask: ToDoTask
    
    //デフォルトRealmの取得
    let realm = try! Realm()
    
    var body: some View {
        Button(action: {
            
            let target = realm.objects(DB.self).filter("id == %@",beforeValueTask.id.uuidString)


            do{
              try realm.write{
                  target[0].name = afterValueTask.name
                  target[0].DBdescription = afterValueTask.description
                  
                  switch afterValueTask.status {
                      case .ToDo:
                        target[0].status = "ToDo"
                      case .WantToDo :
                        target[0].status = "Want"
                      case .Done:
                        target[0].status = "Done"
                  }
                  
                  
                  target[0].kijitsu = afterValueTask.kijitsu
              }
            }catch {
              print("Error \(error)")
            }
            
            beforeValueTask = afterValueTask
            
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("更新")
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

struct UpdateTaskDetailButton_Previews: PreviewProvider {
    static var previews: some View {
        UpdateTaskButton(beforeValueTask: .constant(.init(name: "", description: "", status: .WantToDo, kijitsu: "6月4日")), afterValueTask: .init(name: "", description: "", status: .WantToDo,kijitsu: "6月4日"))
    }
}
