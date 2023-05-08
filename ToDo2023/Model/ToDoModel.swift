//
//  ToDoModel.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2022/06/06.
//

import Foundation
import RealmSwift

final class ToDoModel: ObservableObject {
   // @Published var taskList: [Task] = []
    @Published var taskList: [Task] = createTaskList()
   /*
    func addTask(name: String, description: String, status: TaskStatus, score: Int, kijitsu: Int){
        let addition: Task = .init(name: name, description: description, status: status, score: score, kijitsu: kijitsu)
        self.taskList.append
        
    }
    */
}

struct Task: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var kijitsu:String
    var status: TaskStatus
    
    init(name: String, description: String, status: TaskStatus, kijitsu: String) {
        self.name = name
        self.description = description
        self.status = status
        self.kijitsu = kijitsu
    }
}

enum TaskStatus: String,CaseIterable {
    case ToDo,WantToDo,Done
}


func createTaskList() -> [Task] {
    let realm = try! Realm()

    var taskList: [Task] = []
    let realms = realm.objects(DB.self)
    for b in realms {
        let task: Task = transformTask(db:b)
        taskList.append(task)
    }
    return taskList
}

func transformTask(db:DB) -> Task{
    
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

    
    var after = Task(name:name,description:description,status:statusType,kijitsu:kijitsu)
    
    after.id = uuid
    
    return after
}
