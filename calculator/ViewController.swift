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
    
    @IBOutlet weak var outputLabel: UILabel!

    @IBAction func numbers(_ sender: UIButton) {
        outputLabel.text = outputLabel.text! + String(sender.tag-1);
        numberOnScreen = Double(outputLabel.text!)!;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

