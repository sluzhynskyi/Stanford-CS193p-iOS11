//
//  Card.swift
//  Concentration
//
//  Created by Danylo Sluzhynskyi on 31.12.2020.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var uiid = 0
    
    static func getUniqueIdentifier() -> Int{
        uiid += 1
        return uiid
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
