//
//  ListScreenViewController.swift
//  ToDoListApplication
//
//  Created by KK on 11/15/16.
//  Copyright © 2016 KK. All rights reserved.
//

import UIKit

class ListScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var userDescriptionTextField: UITextField!
    @IBOutlet weak var userInputListItem: UITextField!
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var listTitleLabel: UILabel!
    
    var selectedCell: ListScreenTableViewCell?
    var selectedListIndex: Int!

    @IBAction func buttonWasPressed(_ sender: UIButton) {
    
        let titleText = userInputListItem.text!
        let descriptionText = userDescriptionTextField.text!
        
        let newItem = Item(toDoListItemName: titleText, description: descriptionText)
        lists[selectedListIndex].items.append(newItem)
        listTableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTitleLabel.text = lists[selectedListIndex].toDoListTitleName
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists[selectedListIndex!].items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListScreenTableViewCell", for: indexPath) as! ListScreenTableViewCell
        cell.listTitleListView.text = lists[selectedListIndex].items[indexPath.row].toDoListItemName
       return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ListScreenTableViewCell
        
        if cell === selectedCell {
            cell.backgroundColor = UIColor.white
            selectedCell = nil
            selectedListIndex = nil
            
        }
        else {
            cell.backgroundColor = UIColor.lightGray
            selectedCell?.backgroundColor = UIColor.white
            selectedCell = cell
            selectedListIndex = indexPath.item
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailedItem = segue.destination as! ItemViewController
        detailedItem.selectedItemIndex = listTableView.indexPathForSelectedRow?.row
        detailedItem.selectedListIndex = selectedListIndex
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
