//
//  Landmark.swift
//  Memorize 2020
//
//  Created by Orlando Moraes Martins on 20/12/22.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var cards: [String]
}
