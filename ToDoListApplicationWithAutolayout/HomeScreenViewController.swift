//
//  HomeScreenViewController.swift
//  ToDoListApplication
//
//  Created by KK on 11/15/16.
//  Copyright © 2016 KK. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var homeTitleLabel: UILabel!
    @IBOutlet weak var userInputListNameTextField: UITextField!
    @IBOutlet weak var homeScreenTableView: UITableView!
    
    var selectedCell: HomeScreenTableViewCell?
    var selectedListIndex: Int?

    let key = "persisted-data"
    
    @IBAction func savedButtonWasPressed(_ sender: UIButton) {
        
        if userInputListNameTextField.text == "" {
            
            //UI Alert Control code from Stack OverFlow / Online resources
            let alert = UIAlertController(title: "Alert", message: "Please Enter A List Name", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let userInput = userInputListNameTextField.text
            let newList = List(toDoListTitleName: userInput!)
            
            lists.append(newList)
            
            //Save lists
            let data = NSKeyedArchiver.archivedData(withRootObject: lists)
            UserDefaults.standard.set(data, forKey: key)
           
            userInputListNameTextField.text = ""
            homeScreenTableView.reloadData()
        }
     
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeScreenTableViewCell", for: indexPath) as! HomeScreenTableViewCell
        
        cell.homeTextViewLabel.text = lists[indexPath.row].toDoListTitleName

        return cell
    }
    
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! HomeScreenTableViewCell
        
        if cell === selectedCell {
            cell.backgroundColor = UIColor.white
            selectedCell = nil
        }
        else {
            cell.backgroundColor = UIColor.lightGray
            selectedCell?.backgroundColor = UIColor.white
            selectedCell = cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            lists.remove(at: indexPath.row)
            //save new lists
            let data = NSKeyedArchiver.archivedData(withRootObject: lists)
            UserDefaults.standard.set(data, forKey: key)

            homeScreenTableView.reloadData()
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ListScreenViewController = segue.destination as! ListScreenViewController
        ListScreenViewController.selectedIndex = homeScreenTableView.indexPathForSelectedRow?.row
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
