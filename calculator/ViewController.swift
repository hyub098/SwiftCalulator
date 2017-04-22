//
//  ViewController.swift
//  calculator
//
//  Created by Peter Huang on 18/04/17.
//  Copyright © 2017 Peter Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var answer: Double = 0;
    var performingMath:Bool = false;
//    var previousAdded: Bool = false;
    var operation: Int = 0;
    
    @IBOutlet weak var outputLabel: UILabel!

    @IBAction func buttons(_ sender: UIButton) {
        
        if outputLabel.text != "" && sender.tag != 11 && sender.tag != 16
        {
            
            previousNumber = numberOnScreen;
            
            if sender.tag == 12 // Divide
            {
                outputLabel.text = "/";
                
            }
            else if sender.tag == 13 // multiply
            {
                outputLabel.text = "x";
            }
            else if sender.tag == 14 // minus
            {
                outputLabel.text = "-";
            }
            else if sender.tag == 15 // add
            {
                outputLabel.text = "+";
            }
            performingMath = true;
            operation = sender.tag;
        }
        
        if(sender.tag == 11) {
            reset();
        }
        
        if(sender.tag == 16){
            if operation == 12 // Divide
            {
                outputLabel.text = "/";
                answer = previousNumber / numberOnScreen;

            }
            else if operation == 13 // multiply
            {
                outputLabel.text = "x";
                answer = previousNumber * numberOnScreen;

            }
            else if operation == 14 // minus
            {
                outputLabel.text = "-";
                answer = previousNumber - numberOnScreen;

            }
            else if operation == 15 // add
            {
                outputLabel.text = "+";
                answer = previousNumber + numberOnScreen;
            }
            print(previousNumber);
            print(numberOnScreen)
            print(previousNumber + numberOnScreen);
            outputLabel.text = String(answer);
        }
    }
    @IBAction func numbers(_ sender: UIButton) {
        
        
        if performingMath
        {
            outputLabel.text = String(sender.tag-1);
            numberOnScreen = Double(outputLabel.text!)!;
            performingMath = false;
            
        }
        else{
            
            outputLabel.text = outputLabel.text! + String(sender.tag-1);
            numberOnScreen = Double(outputLabel.text!)!;
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func reset() {
        numberOnScreen = 0;
        performingMath = true;
        previousNumber = 0;
        outputLabel.text = "0";
        operation = 0;
    }

}

