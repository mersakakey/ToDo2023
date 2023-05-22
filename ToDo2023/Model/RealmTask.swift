//
//  RealmTask.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2023/05/08.
//

import Foundation
import RealmSwift

//タスクをrealmに保存するときに使うモデル
class DB: Object {
    @objc dynamic var id: String?
    @objc dynamic var name: String?
    @objc dynamic var DBdescription: String?
    @objc dynamic var status: String?
    @objc dynamic var kijitsu:String?
    
    override init() {
        super.init()
    }
    
    //realmに保存できる形に変形
    
    init(id:String, name: String, DBdescription: String, status: String, kijitsu: String) {
        self.id = id
        self.name = name
        self.DBdescription = DBdescription
        self.status = status
        self.kijitsu = kijitsu
    }
}
