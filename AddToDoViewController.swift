//
//  AddToDoViewController.swift
//  studyhero
//
//  Created by Abigail Figueroa on 7/22/21.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
        override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTapped(_ sender: Any) {
       let toDo = ToDoClass()
        if let titleText = titleTextField.text {
                  toDo.description = titleText
                  toDo.important = importantSwitch.isOn
                }
                previousVC.listOfToDo.append(toDo)
                previousVC.tableView.reloadData()
                navigationController?.popViewController(animated: true)
            }
            }
        
       
          
        
        
        //let toDo = ToDoClass()
        //if let titleText = titleTextField.text {
           // toDo.description = titleText
           // toDo.important = importantSwitch.isOn
    
       // previousVC.listOfToDo.append(toDo)
      //  previousVC.tableView.reloadData()
      //  navigationController?.popViewController(animated: true)



