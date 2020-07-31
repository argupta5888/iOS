//
//  ViewController.swift
//  ConsumeFramework
//
//  Created by esoftuser2 on 13/01/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import UIKit
import TestFramework


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let obj = TestFileManager()
        obj.setFileName(name: "Ashok")
    }
}

