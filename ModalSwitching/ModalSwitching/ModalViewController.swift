//
//  ModalViewController.swift
//  ModalSwitching
//
//  Created by Matt Koenig on 6/17/22.
//

import UIKit

class ModalViewController: UIViewController {
    
    var sourceViewController: UIViewController!
    var validOperation: Bool = true;

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var theNumber: Int = 99;

    
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBAction func numberTextFieldEditingChanged(_ sender: UITextField) {
        let number = numberTextField.text!
        if (number.contains(".") || number.contains("-")) {
            validOperation = false;
        } else {
            theNumber = Int(number)!
            
            if (theNumber > 100 || theNumber < 0) {
                validOperation = false;
        }

        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let svc = sourceViewController as! ViewController;
        
        if (validOperation == true) {
            svc.alertLabel.text = "";
            var sliderValueToChange = Float(theNumber);
            sliderValueToChange = sliderValueToChange / 100.00;
            svc.sliderValue.value = sliderValueToChange;
            svc.sliderNum = Float(theNumber);
            svc.roundedNum = theNumber;
        } else {
            svc.alertLabel.textColor = UIColor.red;
            svc.alertLabel.text = "Invalid slider value entered";
        }
        


    }
    override func viewWillAppear(_ animated: Bool) {
        let numberText = String(theNumber)
        numberTextField.text = numberText;
    }
    

}
