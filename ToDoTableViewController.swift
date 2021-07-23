//
//  ToDoTableViewController.swift
//  studyhero
//
//  Created by Abigail Figueroa on 7/22/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    var listOfToDo : [ToDoClass] = []

     override func viewDidLoad() {
        
        super.viewDidLoad()
        listOfToDo = createToDos()
    }
    func createToDos() -> [ToDoClass] {

          let swift = ToDoClass()
          swift.description = "Study for AP Calc"
          swift.important = true

          let dog = ToDoClass()
          dog.description = "Finish CS hw"
          // important is set to false by default
          return [swift, dog]
        }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return listOfToDo.count
        }

        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

            let toDo = listOfToDo[indexPath.row]
             
            if toDo.important {
               cell.textLabel?.text = "❗️" + toDo.description
             } else {
               cell.textLabel?.text = toDo.description
             }
            
            
            return cell
        }

        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let toDo = listOfToDo[indexPath.row]

            performSegue(withIdentifier: "moveToComplete", sender: toDo)
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let addVC = segue.destination as? AddToDoViewController {
            addVC.previousVC = self
            }
            if let completeVC = segue.destination as? CompleteToDoViewController {
              if let toDo = sender as? ToDoClass {
                completeVC.selectedToDo = toDo
                completeVC.PreviousVC = self
              }
            }
        }
        


    
}
