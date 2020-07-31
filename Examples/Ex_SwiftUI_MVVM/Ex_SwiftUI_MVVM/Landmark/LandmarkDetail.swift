//
//  TestView.swift
//  Ex_SwiftUI_MVVM
//
//  Created by esoftuser2 on 25/05/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    var landmarkIndex: Int {
        userData.landmarks.firstIndex { $0.id == landmark.id }!
    }
    
    mutating func toggle() {
        landmark.toggleFavorite(value: false)
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y:-130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(Color.green)
                    
                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                        
                    }) {
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .imageScale(.large)
                                .foregroundColor(.yellow)
                        }
                        else {
                            Image(systemName: "star")
                                .imageScale(.large)
                                .foregroundColor(.gray)
                        }
                    }
                }
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()
            Spacer()
            
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return LandmarkDetail(landmark: userData.landmarks[0])
        .environmentObject(userData)
    }
}
