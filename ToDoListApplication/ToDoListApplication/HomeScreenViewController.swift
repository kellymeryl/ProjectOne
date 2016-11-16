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

    @IBAction func savedButtonWasPressed(_ sender: UIButton) {
        
        let userInput = userInputListNameTextField.text
        let newList = List(toDoListTitleName: userInput!)
        lists.append(newList)
        userInputListNameTextField.text = ""
        homeScreenTableView.reloadData()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ListScreenViewController = segue.destination as! ListScreenViewController
        ListScreenViewController.selectedListIndex = homeScreenTableView.indexPathForSelectedRow?.row
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
