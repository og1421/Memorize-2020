//
//  LandMarkRow.swift
//  Memorize 2020
//
//  Created by Orlando Moraes Martins on 20/12/22.
//

import Foundation
import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack{
            Text(landmark.cards[0])
            Text(landmark.name)
            
            Spacer()
        }
        
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
            LandmarkRow(landmark: landmarks[2])
        }
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
