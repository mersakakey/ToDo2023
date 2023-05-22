//
//  ToDoViewModel.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2023/05/22.
//

import Foundation
import RealmSwift

final class ToDoModel: ObservableObject {
   // @Published var taskList: [Task] = []
    @Published var taskList: [ToDoTask] = createTaskList()
   /*
    func addTask(name: String, description: String, status: TaskStatus, score: Int, kijitsu: Int){
        let addition: Task = .init(name: name, description: description, status: status, score: score, kijitsu: kijitsu)
        self.taskList.append
        
    }
    */
}

enum TaskStatus: String,CaseIterable {
    case ToDo,WantToDo,Done
}


func createTaskList() -> [ToDoTask] {
    let realm = try! Realm()

    var taskList: [ToDoTask] = []
    let realms = realm.objects(DB.self)
    for b in realms {
        let task: ToDoTask = transformTask(db:b)
        taskList.append(task)
    }
    return taskList
}

func transformTask(db:DB) -> ToDoTask{
    
    let name:String = db.name ?? ""
    let id:String = db.id ?? ""
    let description:String = db.DBdescription ?? ""
    let kijitsu:String = db.kijitsu ?? ""
    
    
    let uuid: UUID = UUID(uuidString: id) ?? UUID()
    var statusType:TaskStatus
    
    switch db.status {
        case "ToDo":
            statusType = .ToDo
        case "Want" :
            statusType = .WantToDo
        case "Done":
            statusType = .Done
        default:
            statusType = .ToDo
            break
    }

    
    var after = ToDoTask(name:name,description:description,status:statusType,kijitsu:kijitsu)
    
    after.id = uuid
    
    return after
}
