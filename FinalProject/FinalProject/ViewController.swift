//
//  ViewController.swift
//  FinalProject
//
//  Created by Matt Koenig on 6/22/22.
//

import UIKit

class ViewController: UIViewController {
    
    // TABLE VIEW
    @IBOutlet var tableView: UITableView!
    
    // TASK ARRAY OF STRINGS
    var tasks = [String]()
    var bodyTasks = [String]()
    
    // CREATE VIEW DELEGATE AND ASSIGN TITLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tasks"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // SET UP THE USER DEFAULTS DATABASE
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        
        // GET CURRENT SAVED TASKS
        updateTasks()
    }
    
    // REFRESH VIEW WHEN COMING BACK
    override func viewWillAppear(_ animated: Bool) {
        
        self.title = "Tasks"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // SET UP THE USER DEFAULTS DATABASE
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        
        // GET CURRENT SAVED TASKS
        updateTasks()
    }
    
    // FUNCTION TO UPDATE THE TASKS
    func updateTasks() {
        
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        for x in 0..<count {
            if let task = UserDefaults().value(forKey: "task_\(x+1)") as? String {
                tasks.append(task)
            }
        }
        tableView.reloadData()
    }

    // USER TABS ADD BUTTON
    @IBAction func didTapAdd() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
    
// EXTENSION FOR WHEN CELL IS SELECTED
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    
        // DELETING ITEM
        let vc = storyboard?.instantiateViewController(withIdentifier: "task") as! TaskViewController
        vc.task = tasks[indexPath.row]
        vc.position = indexPath.row
        vc.title = vc.task
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// DATA SOURCE EXTENSION
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    
}
