//
//  DataModel.swift
//  ToDoListApplication
//
//  Created by KK on 11/15/16.
//  Copyright © 2016 KK. All rights reserved.
//

import Foundation

var lists = [List]()


//convert to NSCoding Type
class List: NSObject, NSCoding {
    
    private struct Keys {
        static let toDoListName = "toDoListName"
    }
    
    var toDoListTitleName: String
    var items = [Item]()
    
    init(toDoListTitleName: String){
        self.toDoListTitleName = toDoListTitleName
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        self.init{
            toDoListTitleName; aDecoder.decodeObject(forKeys: Keys.toDoListTitleName) as! String
        }
    }
    
    func encode(with aCoder: NSCoder){
        aCoder.encode(toDoListItem, forKey: Keys.toDoListTitleName) as! String
    }
}

class Item: NSObject, NSCoding{
    
    private struct Keys {
        static let toDoListItemName = "toDoListItemName"
        static let descript = "description"
    }
    
    
    private (set) var toDoListItemName: String
    private (set) var descript: String
    
    init(toDoListItemName: String, description: String){
        self.toDoListItemName = toDoListItemName
        self.descript = description
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        self.init(
            toDoListItemName: aDecoder.decodeObject(forKeys: Keys.toDoListItemName) as! String,
            descript: aDecoder.decodeObject(forKey: Keys.description) as! String
        )
        
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(toDoListItemName, forKey: Keys.toDoListItemName)
        aCoder.encode(description, forKeys: Keys.description)
    }
    
}



