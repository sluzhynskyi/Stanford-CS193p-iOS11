//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by Danylo Sluzhynskyi on 03.04.2021.
//

import Foundation

struct PlayingCardDeck {
    
    // MARK: - Properties
     
    private(set) lazy var cards = [PlayingCard]()
    
    
    // MARK: - Initialization
    
    init() {
        for suit in PlayingCard.Suit.allCases {
            for rank in PlayingCard.Rank.allCases {
                cards.append(.init(suit: suit, rank: rank))
            }
        }
    }
}


