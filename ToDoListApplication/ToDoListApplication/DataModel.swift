//
//  DataModel.swift
//  ToDoListApplication
//
//  Created by KK on 11/15/16.
//  Copyright © 2016 KK. All rights reserved.
//

import Foundation

var lists = [List]()

class List{
    
    var toDoListTitleName: String
    var items = [Item]()
    
    init(toDoListTitleName: String){
        self.toDoListTitleName = toDoListTitleName
    }
}

class Item{
    
    var toDoListItemName: String
    var description: String
    
    init(toDoListItemName: String, description: String){
        self.toDoListItemName = toDoListItemName
        self.description = description
    }
}



