//
//  HomeViewModel.swift
//  Ex_SwiftUI_MVVM
//
//  Created by esoftuser2 on 29/05/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import Foundation

protocol HomeViewModelType {
    var landmarks: [Landmark] {get}
    func fetchLandmarks()
}

final class HomeViewModel: ObservableObject {
    
    var landmarks: [Landmark] = []
    private var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
    }
}

extension HomeViewModel: HomeViewModelType {
    
    func fetchLandmarks() {
        landmarks = dataManager.fetchLandmarks(fileName: "landmarkData")
    }
}
