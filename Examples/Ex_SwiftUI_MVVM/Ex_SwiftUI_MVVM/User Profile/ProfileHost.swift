//
//  ProfileHost.swift
//  Ex_SwiftUI_MVVM
//
//  Created by esoftuser2 on 01/06/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @State var draftProfile = Profile.default
    
    
    var body: some View {
        Text("Profile for: \(draftProfile.userName)")
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
