//
//  DeleteTaskButton.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2022/06/06.
//

import SwiftUI
import RealmSwift

struct DeleteTaskButton: View {
    @Binding var beforeValueTask: ToDoTask
    @EnvironmentObject var todoModel: ToDoModel
    @Environment(\.presentationMode) var presentationMode
    
    //デフォルトRealmの取得
    let realm = try! Realm()
    
    var body: some View {
        Button(action: {
            
            let target = realm.objects(DB.self).filter("id == %@",beforeValueTask.id.uuidString)


            do{
              try realm.write{
                  realm.delete(target[0])
                  }
                  
                todoModel.taskList.removeAll(where : {
                    $0.id == beforeValueTask.id
                })
              
            }catch {
              print("Error \(error)")
            }
            
            
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("削除")
                .font(.title3)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(width: 100, height: 60)
                .background(Color(.red))
                .cornerRadius(50)
        })
        .padding(.trailing)
        .padding(.top)
    }
}

struct DeleteTaskDetailButton_Previews: PreviewProvider {
    static var previews: some View {
        DeleteTaskButton(beforeValueTask: .constant(.init(name: "", description: "", status: .WantToDo, kijitsu: "6月4日")))
    }
}
