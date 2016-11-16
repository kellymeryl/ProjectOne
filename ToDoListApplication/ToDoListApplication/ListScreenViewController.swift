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
    var selectedIndex: Int?
    var selectedCellIndex: Int?


    @IBAction func buttonWasPressed(_ sender: UIButton) {
        
        if userDescriptionTextField.text == "" &&  userInputListItem.text == "" {
            //UI Alert Control code from Stack OverFlow / Online resources
            let alert = UIAlertController(title: "Alert", message: "Please Enter List Information", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if userInputListItem.text == "" {
            //UI Alert Control code from Stack OverFlow / Online resources
            let alert = UIAlertController(title: "Alert", message: "Please Enter A Title for Your To-Do List Item", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
        else {
    
        let titleText = userInputListItem.text!
        let descriptionText = userDescriptionTextField.text!
        
        let newItem = Item(toDoListItemName: titleText, description: descriptionText)
        lists[selectedIndex!].items.append(newItem)
        listTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTitleLabel.text = lists[selectedIndex!].toDoListTitleName
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists[selectedIndex!].items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListScreenTableViewCell", for: indexPath) as! ListScreenTableViewCell
        cell.listTitleListView.text = lists[selectedIndex!].items[indexPath.row].toDoListItemName
       return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ListScreenTableViewCell
        
        if cell === selectedCell {
            cell.backgroundColor = UIColor.white
            selectedCell = nil
            selectedCellIndex = nil
            
        }
        else {
            cell.backgroundColor = UIColor.lightGray
            selectedCell?.backgroundColor = UIColor.white
            selectedCell = cell
            selectedCellIndex = indexPath.item
        }
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            lists[selectedCellIndex!].items.remove(at: indexPath.row)
            userDescriptionTextField.text = ""
            userInputListItem.text = ""
            listTableView.reloadData()
        }
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailedItem = segue.destination as! ItemViewController
        detailedItem.selectedIndex = selectedIndex
        detailedItem.selectedItemIndex = listTableView.indexPathForSelectedRow?.row
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
