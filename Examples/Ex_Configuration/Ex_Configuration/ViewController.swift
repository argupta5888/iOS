//
//  ViewController.swift
//  Ex_Configuration
//
//  Created by ashok on 16/09/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum DENOMINATION : Int{
        case demo_100 = 100
        case demo_50 = 50
        case demo_20 = 20
        case demo_10 = 10
    }
    
    enum DENOMITAION_COUNT {
        
        case demo_100(type: De, count: Int)
        case demo_50(type: Int, count: Int)
        case demo_20(type: Int, count: Int)
        case demo_10(type: Int, count: Int)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(Environment.rootURL)
        print(Environment.apiKey)
        
        let demo_100 = DENOMITAION.demo_100(count: 2)
        let demo_50 = DENOMITAION.demo_50(count: 0)
        let demo_20 = DENOMITAION.demo_20(count: 10)
        let demo_10 = DENOMITAION.demo_10(count: 20)
    }
    
    func repayBalance(amountCollected: Int, amtCharged: Int) {
        let balanceAmount = amountCollected - amtCharged
        
        
    }

    @IBAction func btnTapped(_ sender: Any) {
        DispatchQueue.global(qos: .userInitiated).async {
            self.compute()
        }
        
    }
    
    private func compute() {
        var counter = 0
        for _ in 0..<9999999 {
            counter += 1
        }
    }
    
}

