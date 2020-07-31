//
//  TodoListView.swift
//  Ex_SwiftUI_MVVM
//
//  Created by esoftuser2 on 25/05/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var viewModel = TodoListViewModel()
    var body: some View {
      
        NavigationView {
            List(viewModel.todos) { todo in
                Text(todo.title)
            }
        .navigationBarTitle(Text("Todo list"))
        }
        
        .onAppear {
            self.viewModel.fetchTodos()
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
