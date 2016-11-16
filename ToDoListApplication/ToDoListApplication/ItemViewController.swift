//
//  ItemViewController.swift
//  ToDoListApplication
//
//  Created by KK on 11/16/16.
//  Copyright © 2016 KK. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    
    @IBOutlet weak var itemDescriptionTitle: UILabel!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var selectedItemIndex: Int!
    var selectedListIndex: Int!

    @IBAction func saveButtonTapped(_ sender: Any) {
        
        lists[selectedListIndex].items[selectedItemIndex].toDoListItemName = descriptionTitleLabel.text!
        lists[selectedListIndex].items[selectedItemIndex].description =  descriptionTextView.text!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTitleLabel.text = lists[selectedListIndex!].items[selectedItemIndex!].toDoListItemName
        descriptionTextView.text = lists[selectedListIndex!].items[selectedItemIndex!].description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
