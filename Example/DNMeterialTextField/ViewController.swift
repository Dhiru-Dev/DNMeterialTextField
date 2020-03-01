//
//  ViewController.swift
//  DNMeterialTextField
//
//  Created by Dhiru-Dev on 02/24/2020.
//  Copyright (c) 2020 Dhiru-Dev. All rights reserved.
//

import UIKit
import DNMeterialTextField

class ViewController: UIViewController {

    let txtFiled = DNMeterialTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtFiled.text = "testing"
        print()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

