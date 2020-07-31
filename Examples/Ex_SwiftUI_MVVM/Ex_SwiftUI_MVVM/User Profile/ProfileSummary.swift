//
//  ProfileSummary.swift
//  Ex_SwiftUI_MVVM
//
//  Created by esoftuser2 on 02/06/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
   static var goalFormat: DateFormatter = {
        let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .medium
        return formatter
    }()
    
    var body: some View {
        List {
            Text(profile.userName)
            .bold()
            .font(.title)
            
            Text("Notification: \(profile.prefersNotification ? "On" : "Off")")
            Text("Seasonal Photo: \(profile.seasonalPhoto.rawValue)")
            Text("Goal Date: \(profile.goalDate, formatter: Self.goalFormat )")
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
