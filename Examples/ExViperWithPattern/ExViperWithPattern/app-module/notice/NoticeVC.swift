//
//  ViewController.swift
//  ExViperWithPattern
//
//  Created by esoftuser2 on 17/03/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import UIKit

class NoticeVC: UIViewController {
    
    var presenter: NoticePresenterType?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = NoticePresenter()
        presenter?.startFecthingNotice()
    }
    
    @IBAction func btnClickTapped(_ sender: Any) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension NoticeVC: ViewDelegate {
    func willLoadData() {
        
    }
    
    func didLoadData() {
        
    }
    
    func didFail() {
        
    }
}

