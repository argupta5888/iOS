//
//  Profile.swift
//  Ex_SwiftUI_MVVM
//
//  Created by esoftuser2 on 02/06/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import Foundation


struct Profile {
    var userName: String
    var prefersNotification: Bool
    var seasonalPhoto: Season
    var goalDate: Date

    static var `default` = Self(username: "a.gupta", prefersNotification: true, seasonalPhoto: .winter)
    
    init(username: String, prefersNotification: Bool = true, seasonalPhoto: Season = .winter ) {
        self.userName = username
        self.prefersNotification = prefersNotification
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = Date()
    }
    
    enum Season: String, CaseIterable {
        case spring = "🌷"
        case summer = "🌝"
        case autum = "🍂"
        case winter = "⛄️"
    }
}
