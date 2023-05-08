//
//  RealmTask.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2023/05/08.
//

import Foundation
import RealmSwift


class DB: Object {
    @objc dynamic var id: String?
    @objc dynamic var name: String?
    @objc dynamic var DBdescription: String?
    @objc dynamic var status: String?
    @objc dynamic var kijitsu:String?
    
    override init() {
        super.init()
    }
    
    init(id:String, name: String, DBdescription: String, status: String, kijitsu: String) {
        self.id = id
        self.name = name
        self.DBdescription = DBdescription
        self.status = status
        self.kijitsu = kijitsu
    }
}
