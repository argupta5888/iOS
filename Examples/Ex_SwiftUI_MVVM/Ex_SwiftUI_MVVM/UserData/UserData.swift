//
//  UserData.swift
//  Ex_SwiftUI_MVVM
//
//  Created by esoftuser2 on 28/05/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import Foundation
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks: [Landmark] = landmarkData
}
