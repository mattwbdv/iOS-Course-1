//
//  ViewController.swift
//  ModalSwitching
//
//  Created by Matt Koenig on 6/17/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var sliderNum: Float = 0.0;
    var roundedNum: Int = 0;


    @IBAction func SliderPressed(_ sender: Any) {
    }
    
    @IBOutlet weak var alertLabel: UILabel!
    
    @IBAction func DisplayValuePressed(_ sender: Any) {
        sliderNum = sliderValue.value * 100;
        roundedNum = Int(sliderValue.value * 100);
    }
    
    @IBOutlet weak var sliderValue: UISlider!
    
    @IBAction func unwindLocationCancel (unwindSegue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toModalView") {

            
            // pass the value to the modal
            let destVC = segue.destination as! UINavigationController;
            let destVC2 = destVC.viewControllers[0] as! ModalViewController;
            destVC2.theNumber = roundedNum;
            destVC2.sourceViewController = self; 
        }
    }
    
}

