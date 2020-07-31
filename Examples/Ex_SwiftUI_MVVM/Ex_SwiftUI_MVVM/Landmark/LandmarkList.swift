//
//  LandmarkList.swift
//  Ex_SwiftUI_MVVM
//
//  Created by esoftuser2 on 27/05/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
   @State var showFavoritesOnly = false
    @EnvironmentObject var userData: UserData
   // var landmarks: [Landmark]
    
    var body: some View {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(userData.landmarks) { landmark in
                    if !self.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
        .environmentObject(UserData())
    }
}
