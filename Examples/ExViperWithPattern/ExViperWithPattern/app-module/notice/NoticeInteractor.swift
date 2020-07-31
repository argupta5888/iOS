//
//  NoticeInteractor.swift
//  ExViperWithPattern
//
//  Created by esoftuser2 on 17/03/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import Foundation

class NoticeInteractor: NoticeInteractorType {
    
    var delegate: NoticeInteractorDelegate?

    func fetchNoticeList() {
        let result = false
        
        result ? delegate?.noticeFetchSuccess() : delegate?.noticeFetchFail()
    }
}


