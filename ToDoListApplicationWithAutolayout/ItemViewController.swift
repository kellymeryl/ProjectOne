//
//  ItemViewController.swift
//  ToDoListApplication
//
//  Created by KK on 11/16/16.
//  Copyright © 2016 KK. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
//    @IBOutlet weak var itemDescriptionTitle: UILabel!
//    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var selectedIndex: Int?
    var selectedItemIndex: Int?
    
    var item: Item!

    override func viewWillDisappear(_ animated: Bool) {
        item.toDoListItemName = titleTextField.text!
        item.description =  descriptionTextView.text!

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
       // guard let labelText = lists[selectedListIndex?].items[selectedItemIndex?].toDoListItemName else { return }
       // descriptionTitleLabel.text = labelText
        
      item = lists[selectedIndex!].items[selectedItemIndex!]
      titleTextField.text = item.toDoListItemName
      descriptionTextView.text = item.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
