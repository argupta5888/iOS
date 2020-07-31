//
//  Presenter.swift
//  ExViperWithPattern
//
//  Created by esoftuser2 on 17/03/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import Foundation

class NoticePresenter: NoticePresenterType {
   
    var router: NoticeRouterType?
    var view: ViewDelegate?
    var interactor: NoticeInteractorType?
    
    init() {
        router = NoticeRouter()
        interactor = NoticeInteractor()
        interactor?.delegate = self
    }
    
    func startFecthingNotice() {
        interactor?.fetchNoticeList()
    }
       
}

extension NoticePresenter: NoticeInteractorDelegate {
    
    func noticeFetchSuccess() {
        view?.didLoadData()
    }
    func noticeFetchFail() {
        view?.didFail()
    }
}
