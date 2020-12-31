//
//  Concentration.swift
//  Concentration
//
//  Created by Danylo Sluzhynskyi on 31.12.2020.
//

import Foundation

class Concentration {
    private(set) var cards: [Card] = []

    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (newValue == index)
            }
        }
    }

    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        let card = cards[index]
        if !card.isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Only one card is FaceUP
                if card.identifier == cards[matchIndex].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true

            }
            else {
                // Either no cards or 2 cards are FaceUp
                indexOfOneAndOnlyFaceUpCard = index
            }

        }
    }
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(numberOfPairsOfCards: \(numberOfPairsOfCards)): you must have at least one pair of cards")
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }

}
