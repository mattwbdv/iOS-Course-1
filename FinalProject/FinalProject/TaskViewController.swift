//
//  TaskViewController.swift
//  FinalProject
//
//  Created by Matt Koenig on 6/22/22.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var label2: UILabel!
    
    var task: String?
    var position: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = task
        guard let positionModified = (position ?? 1) + 1 as? Int else {
            return
        }
        guard let taskBody = UserDefaults().value(forKey: "body_\(positionModified)") as? String else {

            return
        }
        
        if let taskBodyString = taskBody as? String {
            label2.text = taskBodyString

        }
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
        
    }


    
    @objc func deleteTask() {
       
        // FIGURE OUT HOW MANY ENTRIES THERE ARE
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        // UPDATE ENTRIES TO BE ONE LESS
        let newCount = count - 1
        UserDefaults().setValue(newCount, forKey: "count")
    
        // SET VALUE OF THE KEY WE ARE REMOVING TO NIL
        UserDefaults().setValue(nil, forKey:"task_\(position! + 1)")
        
        // FOR EVERYTHING ABOVE THE NIL VALUE, DECREMENT ITS KEY
        for x in position! + 2..<count + 1 {
            let oldValue = UserDefaults().value(forKey: "task_\(x)")
            UserDefaults().setValue(oldValue, forKey:"task_\(x-1)")
            let oldBodyValue = UserDefaults().value(forKey: "body_\(x)")
            UserDefaults().setValue(oldBodyValue, forKey:"body_\(x-1)")

            

        }
        

        
        navigationController?.popViewController(animated: true)

    }
    



}
