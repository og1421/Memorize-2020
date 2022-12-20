//
//  LandMarkList.swift
//  Memorize 2020
//
//  Created by Orlando Moraes Martins on 20/12/22.
//

import SwiftUI

struct LandMarkList: View {
    var body: some View {
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkList()
    }
}
