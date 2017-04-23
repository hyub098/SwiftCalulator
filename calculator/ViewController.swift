//
//  ViewController.swift
//  calculator
//
//  Created by Peter Huang on 18/04/17.
//  Copyright © 2017 Peter Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentNumber:Double = -9999;
    var firstNumber:Double = 0;
    var answer: Double = 0;
    var performingMath:Bool = false;
    var operation: Int = 0;
    
    @IBOutlet weak var outputLabel: UILabel!

    @IBAction func buttons(_ sender: UIButton) {
        
        if outputLabel.text != "" && sender.tag != 11 && sender.tag != 16
        {
            if(currentNumber == -9999) {return;}
            
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
            if(operation != 0){
                calculate();
            }
            else {
                firstNumber = currentNumber;
            }
            operation = sender.tag;

            
        }
        
        if(sender.tag == 11) {
            reset(hasAnswer: false);
        }
        
        if(sender.tag == 16){
            
            if(currentNumber == -9999) {return;}
            calculate();
            reset(hasAnswer: true);

        }
    }
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath
        {
            outputLabel.text = String(sender.tag-1);
            currentNumber = Double(outputLabel.text!)!;
            performingMath = false;
        }
        else{
            
            outputLabel.text = outputLabel.text! + String(sender.tag-1);
            currentNumber = Double(outputLabel.text!)!;
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

    func calculate() {
        

        if operation == 12 // Divide
        {
            outputLabel.text = "/";
            answer = firstNumber / currentNumber;
            
        }
        else if operation == 13 // multiply
        {
            outputLabel.text = "x";
            answer = firstNumber * currentNumber;
            
        }
        else if operation == 14 // minus
        {
            outputLabel.text = "-";
            answer = firstNumber - currentNumber;
            
        }
        else if operation == 15 // add
        {
            outputLabel.text = "+";
            answer = firstNumber + currentNumber;
        }
        firstNumber = answer;
        outputLabel.text = String(answer);
        
        
    }
    
    func reset(hasAnswer: Bool) {
        firstNumber = 0;
        performingMath = false;
        currentNumber = -9999;
        operation = 0;
        
        if(hasAnswer) {
            outputLabel.text = String(answer);
            performingMath = true;
        } else{outputLabel.text = "";}
        
        
        answer = 0;

    }

}

