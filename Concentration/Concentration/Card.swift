//
//  Card.swift
//  Concentration
//
//  Created by Danylo Sluzhynskyi on 31.12.2020.
//

import Foundation

struct Card: Hashable, Equatable {
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int

    private static var uiid = 0

    private static func getUniqueIdentifier() -> Int {
        uiid += 1
        return uiid
    }

    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.identifier == rhs.identifier
    }

}
