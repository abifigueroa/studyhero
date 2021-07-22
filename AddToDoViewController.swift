//
//  AddToDoViewController.swift
//  studyhero
//
//  Created by Abigail Figueroa on 7/22/21.
//

import UIKit
import CoreData

class AddToDoViewController: UIViewController {
    var previousVC = ToDoTableViewController()
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
        override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)
            
            if let titleText = titleTextField.text {
                toDo.name = titleText
                        toDo.important = importantSwitch.isOn
        }
       
            try? context.save()

                navigationController?.popViewController(animated: true)
        
        
        //let toDo = ToDoClass()
        //if let titleText = titleTextField.text {
           // toDo.description = titleText
           // toDo.important = importantSwitch.isOn
    }
       // previousVC.listOfToDo.append(toDo)
      //  previousVC.tableView.reloadData()
      //  navigationController?.popViewController(animated: true)
}

}
