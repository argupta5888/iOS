//
//  ContentView.swift
//  ExSwiftUI
//
//  Created by esoftuser2 on 24/01/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Text("Hello, World!")
                        .font(.largeTitle)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
