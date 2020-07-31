//
//  TodoListViewModel.swift
//  Ex_SwiftUI_MVVM
//
//  Created by esoftuser2 on 25/05/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import Foundation
import Combine

protocol TodoListViewModelType {
    var todos: [Todo] {get}
    func fetchTodos()
}

final class TodoListViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    
    private var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
       
    }
}

extension TodoListViewModel : TodoListViewModelType {
    func fetchTodos() {
       todos = self.dataManager.fetchTodoList(includingCompleted: false)
    }
}
