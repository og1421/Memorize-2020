//
//  Array+identifiable.swift
//  Memorize 2020
//
//  Created by Orlando Moraes Martins on 20/12/22.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex (matching: Element) -> Int? {
        for index in 0..<self.count{
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
