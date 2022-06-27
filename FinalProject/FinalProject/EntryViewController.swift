//
//  EntryViewController.swift
//  FinalProject
//
//  Created by Matt Koenig on 6/22/22.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet var field: UITextField!
    @IBOutlet var body: UITextView!
    
    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        body.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        
        return true
    }
    
    
    @objc func saveTask() {
        
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        guard let bodyText = body.text, !text.isEmpty else {
            return
        }

        
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")
        UserDefaults().set(bodyText, forKey: "body_\(newCount)")

        
        update?()
        
        navigationController?.popViewController(animated: true)

        
    }
    

}
