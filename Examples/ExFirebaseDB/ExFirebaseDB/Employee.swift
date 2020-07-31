//
//  Employee.swift
//  ExFirebaseDB
//
//  Created by esoftuser2 on 18/04/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import Foundation


struct Employee : Codable {
    
    let name : String?
    let location : String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case location = "location"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        location = try values.decodeIfPresent(String.self, forKey: .location)
    }

}

