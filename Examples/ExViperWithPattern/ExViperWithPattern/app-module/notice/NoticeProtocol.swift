//
//  NoticeProtocol.swift
//  ExViperWithPattern
//
//  Created by esoftuser2 on 17/03/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import Foundation
import UIKit


// The interactor has a delegate which is fired back to presenter on some completion which further pushes to view using the presenter delegate... Similar to MVVM just need to add delegate to datasource module and add router module

protocol NoticePresenterType: class {
    var view: ViewDelegate? {get set}
    var interactor: NoticeInteractorType? {get set}
    var router: NoticeRouterType? {get set}
    func startFecthingNotice()
}

protocol ViewDelegate: class {
    func willLoadData()
    func didLoadData()
    func didFail()
}

protocol NoticeRouterType: class {
    static func createView() -> NoticeVC
    func pushToMovieVC(navigation: UINavigationController)
}

protocol NoticeInteractorType: class {
    var delegate: NoticeInteractorDelegate? {get set}
    func fetchNoticeList()
}

protocol NoticeInteractorDelegate: class {
    func noticeFetchSuccess()
    func noticeFetchFail()
}
