//
//  Array+Only.swift
//  Memorize 2020
//
//  Created by Orlando Moraes Martins on 20/12/22.
//

import Foundation

extension Array{
    var only: Element?{
        count == 1 ? first : nil
    }
}

