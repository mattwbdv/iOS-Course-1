//
//  ViewController.swift
//  Prog3mdk0027SU22
//
//  Created by Matt Koenig on 5/26/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var UA_Image: UIImageView!
    
    @IBOutlet weak var AU_Image: UIImageView!
    
    @IBOutlet weak var SEC_Image: UIImageView!

    @IBAction func AU_Button(_ sender: Any) {
        UA_Image.isHidden = true
        SEC_Image.isHidden = true
        AU_Image.isHidden = false
    }
    
    @IBAction func SEC_Button(_ sender: Any) {
        UA_Image.isHidden = true
        SEC_Image.isHidden = false
        AU_Image.isHidden = true
    }
    
    @IBAction func UA_Button(_ sender: Any) {
        UA_Image.isHidden = false
        SEC_Image.isHidden = true
        AU_Image.isHidden = true
    }
    
}

