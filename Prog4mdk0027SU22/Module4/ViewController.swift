//
//  ViewController.swift
//  Module4
//
//  Created by Matt Koenig on 6/4/22.
//

import UIKit
import Darwin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var loanAmount: UITextField!
    
    @IBOutlet weak var numPayments: UITextField!
    
    @IBOutlet weak var rate: UITextField!
    
    @IBOutlet weak var answer: UILabel!
    
    @IBAction func onTapRecognized(_ sender: Any) {
        loanAmount.resignFirstResponder()
        numPayments.resignFirstResponder()
        rate.resignFirstResponder()
    }
    
    @IBAction func calculateAmount(_ sender: Any) {

        let convertedAmt: Float = Float(loanAmount.text!) ?? 0
        let convertedPayments: Int = Int(numPayments.text!) ?? 0
        let convertedRate: Float = Float(rate.text!) ?? 0
        
        let finalAnswer: Float = payment(loanAmount: convertedAmt, payments: convertedPayments, interestRate: convertedRate)
        let finalPrint: String = String(finalAnswer)
        
        answer.text = finalPrint
        
        // function to calculate final answer
        func payment(loanAmount: Float, payments: Int, interestRate: Float) -> Float {
            

            let internalVariable: Float = Float(pow(Double(1+interestRate),Double(payments)))
            return Float(Float(loanAmount) * internalVariable * interestRate) / Float(internalVariable - 1)
            

        }
        
    }
    

    
}

