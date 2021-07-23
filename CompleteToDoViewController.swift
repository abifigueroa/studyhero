//
//  CompleteToDoViewController.swift
//  studyhero
//
//  Created by Abigail Figueroa on 7/22/21.
//

import UIKit

class CompleteToDoViewController: UIViewController {
    var PreviousVC = ToDoTableViewController ()
    
    var selectedToDo = ToDoClass()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedToDo.description

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Completetapped(_ sender: Any) {
        showAlert()
          }
    func showAlert() {
        let alert = UIAlertController(title: "You completed a task!", message: "Great job! Remember, hard work and determination will really pay off", preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "Thank You!", style: .cancel, handler: { action in
            print("tapped Thank You!")
        }))
        present(alert, animated: true)
    }
    func showActionSheet() {
        
        }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
