//
//  CategoryHome.swift
//  Ex_SwiftUI_MVVM
//
//  Created by esoftuser2 on 28/05/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var userData: UserData
    
    var viewModel = HomeViewModel()
    
    var categories: [String:[Landmark]] {
        Dictionary(grouping: userData.landmarks, by: {$0.category.rawValue} )
    }
    
    var featured: [Landmark] {
        userData.landmarks.filter { $0.isFavorite}
    }
    
        @State var showProfile = false
        
        var btnProfile: some View {
            Button(action: {
                self.showProfile.toggle()
            }) {
                Image(systemName: "person.crop.circle")
                    .imageScale(.large)
                    .accessibility(label: Text("User Profile"))
                .padding()
            }
        }
    
    var body: some View {
        NavigationView {
            List {
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                NavigationLink(destination: LandmarkList()) {
                Text("See All")
                }
            }
            .navigationBarTitle("Featured")
            .navigationBarItems(trailing: btnProfile)
            .sheet(isPresented: $showProfile) {
               ProfileHost()
                .environmentObject(self.userData)
            }
        
        }.navigationViewStyle(StackNavigationViewStyle())
        .onAppear() {
            self.viewModel.fetchLandmarks()
            self.userData.landmarks = self.viewModel.landmarks
        }
    }
}

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        self.landmarks[0].image.resizable()
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        Home()
        .environmentObject(UserData())
    }
}
