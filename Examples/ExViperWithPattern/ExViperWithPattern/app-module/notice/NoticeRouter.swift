//
//  NoticeRouter.swift
//  ExViperWithPattern
//
//  Created by esoftuser2 on 17/03/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import Foundation
import UIKit

class NoticeRouter: NoticeRouterType {
    
    static func createView() -> NoticeVC {
        let noticeVC = mainStoryboard.instantiateViewController(withIdentifier: "NoticeVC") as! NoticeVC
        
        let presenter: NoticePresenterType & NoticeInteractorDelegate = NoticePresenter()
        let interactor: NoticeInteractorType = NoticeInteractor()
       // let router: NoticeRouterType = NoticeRouter()
        
        noticeVC.presenter = presenter
        
        presenter.view = noticeVC
        //presenter.router = router
        presenter.interactor = interactor
        interactor.delegate = presenter
        
        return noticeVC
    }
    
    func pushToMovieVC(navigation: UINavigationController) {
        
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}
