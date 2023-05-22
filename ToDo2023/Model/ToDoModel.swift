//
//  ToDoModel.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2022/06/06.
//

import Foundation
import RealmSwift


struct ToDoTask: Identifiable {
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
