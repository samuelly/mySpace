//
//  ViewController.swift
//  Calculator
//
//  Created by zhuqi on 15/9/1.
//  Copyright (c) 2015年 zhuqi. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        display.text = display.text! + digit
        println("digit is \(digit)")
    }
}

