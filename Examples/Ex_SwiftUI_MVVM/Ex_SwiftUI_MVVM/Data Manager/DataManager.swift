//
//  DataManager.swift
//  Ex_SwiftUI_MVVM
//
//  Created by esoftuser2 on 25/05/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import Foundation

struct Todo: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}

protocol DataManagerProtocol {
    func fetchTodoList(includingCompleted: Bool) -> [Todo]
    func fetchLandmarks(fileName: String) -> [Landmark]
}


class DataManager {
    static let shared: DataManager  = DataManager()
    private var todos: [Todo] = []
    

    init() {
        todos.append(Todo(id:UUID(), title: "Morning Workout", isCompleted: true))
        todos.append(Todo(id: UUID(), title: "Sign Documents", isCompleted: false))
    }
    
    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: "json")
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}

extension DataManager: DataManagerProtocol  {
 
    func fetchLandmarks(fileName: String) -> [Landmark] {
        return load(fileName)
    }
    
    func fetchTodoList(includingCompleted: Bool) -> [Todo] {
        return includingCompleted ? todos : todos.filter{ !$0.isCompleted}
    }
}
