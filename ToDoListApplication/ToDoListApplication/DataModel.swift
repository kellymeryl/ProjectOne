//
//  DataModel.swift
//  ToDoListApplication
//
//  Created by KK on 11/15/16.
//  Copyright © 2016 KK. All rights reserved.
//

import Foundation

var lists = [List]()

class List: NSObject, NSCoding {
    
    private struct Keys {
        static let toDoListTitleName = "toDoListTitleName"
    }
    
    var toDoListTitleName: String
    var items = [Item]()
    
    init(toDoListTitleName: String){
        self.toDoListTitleName = toDoListTitleName
    }
    required convenience init?(coder aDecoder: NSCoder){
        self.init(
            toDoListTitleName: aDecoder.decodeObject(forKey: Keys.toDoListTitleName) as! String
        )
    }
    
    func encode(with aCoder: NSCoder){
        aCoder.encode(toDoListTitleName, forKey: Keys.toDoListTitleName)
    }
}

class Item: NSObject, NSCoding {
    
    private struct Keys {
        static let toDoListItemName = "toDoListItemName"
        static let description = "description"
    }
    
    var toDoListItemName: String
    var descript: String
    
    init(toDoListItemName: String, description: String){
        self.toDoListItemName = toDoListItemName
        self.descript = description
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        self.init(
            toDoListItemName: aDecoder.decodeObject(forKey: Keys.toDoListItemName) as! String,
            description: aDecoder.decodeObject(forKey: Keys.description) as! String
        )
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(toDoListItemName, forKey: Keys.toDoListItemName)
        aCoder.encode(description, forKey: Keys.description)
    }
}



