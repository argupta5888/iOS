//
//  Landmark.swift
//  Ex_SwiftUI_MVVM
//
//  Created by esoftuser2 on 26/05/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
  

    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}

extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
    
    var _isFavorite: Bool {
        get {
          return isFavorite
        }
        set {
            isFavorite = newValue
        }
    }
    mutating func toggleFavorite(value: Bool) {
          isFavorite = value
      }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
