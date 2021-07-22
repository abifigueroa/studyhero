//
//  CompleteToDoViewController.swift
//  studyhero
//
//  Created by Abigail Figueroa on 7/22/21.
//

import UIKit

class CompleteToDoViewController: UIViewController {
    var PreviousVC = ToDoTableViewController ()
    
    var selectedToDo : ToDoCD?
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedToDo?.description

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Completetapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theToDo = selectedToDo {
              context.delete(theToDo)
              navigationController?.popViewController(animated: true)
            }
          }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


